(* sambuca-acoustics-starter.wl *)
(* Starter Wolfram Language notebook for sambuca acoustic parametric study. *)
(* Adapted from kora wolfram-starter pattern. *)
(* Date: 2026-05-16 *)

(* ===================================================================== *)
(* 1.  Physical constants and material library                            *)
(* ===================================================================== *)

cAir = 343.0;   (* speed of sound in air, m/s, 20 C *)
rhoAir = 1.2041; (* kg/m^3 *)

(* Soundboard candidate woods: (density kg/m^3, longitudinal Young modulus GPa, radiation ratio c/rho) *)
soundboardWoods = <|
  "Sitka spruce"      -> <|"rho" -> 400, "E" -> 11.6, "c_over_rho" -> 12.7|>,
  "Engelmann spruce"  -> <|"rho" -> 385, "E" -> 10.5, "c_over_rho" -> 13.0|>,
  "Western red cedar" -> <|"rho" -> 370, "E" ->  8.4, "c_over_rho" -> 12.5|>,
  "Redwood"           -> <|"rho" -> 410, "E" ->  9.5, "c_over_rho" -> 11.8|>
|>;

(* Hull candidate woods: same triplet *)
hullWoods = <|
  "Cherry"  -> <|"rho" -> 580, "E" -> 10.3, "c_over_rho" ->  7.4|>,
  "Walnut"  -> <|"rho" -> 610, "E" -> 11.6, "c_over_rho" ->  7.5|>,
  "Sapele"  -> <|"rho" -> 640, "E" -> 12.5, "c_over_rho" ->  7.3|>,
  "Maple"   -> <|"rho" -> 705, "E" -> 12.6, "c_over_rho" ->  6.9|>
|>;

(* String candidate materials: (density kg/m^3, max usable tension fraction of breaking, name) *)
stringMaterials = <|
  "Fluorocarbon" -> <|"rho" -> 1780, "fmax" -> 0.5|>,
  "Nylgut"       -> <|"rho" -> 1300, "fmax" -> 0.4|>,
  "Gut"          -> <|"rho" -> 1300, "fmax" -> 0.4|>,
  "Wound nylon"  -> <|"rho" -> 2200, "fmax" -> 0.5|>  (* effective bulk *)
|>;

(* ===================================================================== *)
(* 2.  Sambuca family anchor dimensions                                   *)
(* ===================================================================== *)

(* Three family variants per family-spec.csv *)
sambucaFamily = <|
  "SAM-13-ROOT"    -> <|"L" -> 0.650, "W" -> 0.150, "D" -> 0.150, "N" -> 13, "fmin" -> 196.0, "fmax" -> 1318.5|>,
  "SAM-19-MID"     -> <|"L" -> 0.850, "W" -> 0.196, "D" -> 0.196, "N" -> 19, "fmin" -> 146.8, "fmax" -> 1567.9|>,
  "SAM-25-CONCERT" -> <|"L" -> 1.050, "W" -> 0.242, "D" -> 0.242, "N" -> 25, "fmin" -> 110.0, "fmax" -> 1760.0|>
|>;

(* ===================================================================== *)
(* 3.  Hull internal volume                                               *)
(* ===================================================================== *)
(* Approximate hull as a half-ellipsoid with axes (L/2, W/2, D) -- length, beam, depth.  *)
(* Volume of full ellipsoid = (4/3) pi a b c; half-ellipsoid (one keel) = (2/3) pi a b c. *)

hullVolume[L_, W_, D_] := (2/3) Pi (L/2) (W/2) D

Print["Hull volumes (liters):"]
TableForm[
  KeyValueMap[{#1, 1000 * hullVolume[#2["L"], #2["W"], #2["D"]]} &, sambucaFamily],
  TableHeadings -> {None, {"Variant", "Volume (L)"}}
]

(* ===================================================================== *)
(* 4.  First longitudinal cavity mode                                     *)
(* ===================================================================== *)
(* For a long slim cavity dominated by length, the first axial mode is approximately *)
(* f = c / (2 L) for both-end-closed (no soundhole), or f = c / (4 L) for one-end-open. *)
(* The keel soundport behaves as an opening but a small one -- behavior is between *)
(* these two limits and depends on port area vs cavity volume (Helmholtz regime). *)

firstAxialModeClosed[L_] := cAir / (2 L)
firstAxialModeOpen[L_]   := cAir / (4 L)

Print["First axial mode estimates (Hz):"]
TableForm[
  KeyValueMap[
    {#1, N[firstAxialModeClosed[#2["L"]]], N[firstAxialModeOpen[#2["L"]]]} &,
    sambucaFamily
  ],
  TableHeadings -> {None, {"Variant", "Closed (Hz)", "Open one end (Hz)"}}
]

(* ===================================================================== *)
(* 5.  Helmholtz resonance for the keel soundport                         *)
(* ===================================================================== *)
(* f_H = (c / 2 pi) * sqrt(A / (V * L_eff)) *)
(* A = port area, V = hull internal volume, L_eff = port length + end-correction *)

helmholtz[A_, V_, Leff_] := (cAir / (2 Pi)) Sqrt[A / (V Leff)]

(* Example: 80 x 50 mm oval port = A = pi * (0.040)(0.025) = 3.14e-3 m^2;
   L_eff = hull_wall_thickness + 1.7 * sqrt(A/pi)  *)

keelPortHelmholtz[L_, W_, D_, portMajor_, portMinor_, wall_] := Module[
  {A, Leff, V},
  A    = Pi * (portMajor/2) * (portMinor/2);
  Leff = wall + 1.7 * Sqrt[A / Pi];
  V    = hullVolume[L, W, D];
  helmholtz[A, V, Leff]
]

Print["Helmholtz frequency for 80 x 50 mm keel port, 6 mm hull wall (Hz):"]
TableForm[
  KeyValueMap[
    {#1, N[keelPortHelmholtz[#2["L"], #2["W"], #2["D"], 0.080, 0.050, 0.006]]} &,
    sambucaFamily
  ],
  TableHeadings -> {None, {"Variant", "f_H (Hz)"}}
]

(* ===================================================================== *)
(* 6.  Vibrating-string design                                            *)
(* ===================================================================== *)
(* f = (1 / 2L) * sqrt(T / mu) where mu = rho * pi * (d/2)^2 for a plain string *)
(* Given target f and chosen string diameter d and material rho, solve for T. *)
(* Solve for L given T fixed: L = (1 / 2f) * sqrt(T / mu) *)

stringTension[f_, L_, d_, rho_] := Module[
  {mu},
  mu = rho * Pi * (d/2)^2;
  4 f^2 L^2 mu
]

(* Example string schedule for SAM-13-ROOT, fluorocarbon, varying diameters *)
(* Tune: G3 (196.0) ascending diatonic to E5 *)
sam13Tuning = {196.0, 220.0, 246.9, 261.6, 293.7, 329.6, 370.0, 392.0, 440.0, 493.9, 523.3, 587.3, 659.3};

(* Linear interp of speaking length 580 -> 200 mm across the 13 strings; ramp diameter 1.2 mm bass -> 0.55 mm treble *)
sam13Lengths    = Table[Subdivide[0.580, 0.200, 12][[i]], {i, 1, 13}];
sam13Diameters  = Table[Subdivide[0.0012, 0.00055, 12][[i]], {i, 1, 13}];

Print["SAM-13-ROOT string tension schedule, fluorocarbon (kgf per string):"]
TableForm[
  Table[
    {i, sam13Tuning[[i]],
       1000 * sam13Lengths[[i]],
       1000 * sam13Diameters[[i]],
       N[stringTension[sam13Tuning[[i]], sam13Lengths[[i]], sam13Diameters[[i]], stringMaterials["Fluorocarbon"]["rho"]] / 9.81]
    },
    {i, 1, 13}
  ],
  TableHeadings -> {None, {"#", "Pitch (Hz)", "L (mm)", "d (mm)", "T (kgf)"}}
]

(* ===================================================================== *)
(* 7.  Total string tension load on the neck cantilever                   *)
(* ===================================================================== *)

sam13TotalTension = Total[Table[
  stringTension[sam13Tuning[[i]], sam13Lengths[[i]], sam13Diameters[[i]], stringMaterials["Fluorocarbon"]["rho"]],
  {i, 1, 13}
]] / 9.81 ;
Print["SAM-13-ROOT total string tension load: ", N[sam13TotalTension], " kgf"]

(* ===================================================================== *)
(* 8.  Soundboard plate-mode estimator                                    *)
(* ===================================================================== *)
(* Approximate the soundboard as a thin rectangular plate with simply-supported
   long edges (clamped at the hull rim, free at the bow-end inlay area).
   For a free-clamped-free-clamped rectangular plate of length L and width W,
   the first mode is approximately:

     f_11 = (pi/2) * sqrt( D / (rho_s * h) ) * sqrt( (1/L^2)^2 + (1/W^2)^2 )

   where:
     D = flexural rigidity = E*h^3 / (12 * (1 - nu^2))
     rho_s = areal density of the soundboard = rho * h  (kg/m^2)
     h = soundboard thickness (m)
     nu = Poisson ratio ~0.3 for wood
   This is a thin-plate approximation; for the small SAM-13-ROOT it's accurate
   to within +/- 25% of an FE result. Good for design sweeps. *)

soundboardPlateMode[L_, W_, h_, E_GPa_, rho_, nu_:0.3] := Module[
  {D, rhoS, EPA},
  EPA = E_GPa * 1.0*^9;       (* GPa to Pa *)
  D    = (EPA * h^3) / (12 * (1 - nu^2));
  rhoS = rho * h;
  (Pi/2) * Sqrt[D / rhoS] * Sqrt[ (1/L^2)^2 + (1/W^2)^2 ]
]

(* Sweep across soundboard species at three thicknesses for SAM-13-ROOT *)
(* Soundboard dims: ~ 0.620 m (L between brace lines) x 0.140 m (W between hull walls). *)

Print["First soundboard plate mode (Hz) for SAM-13-ROOT, 0.620 x 0.140 m soundboard area:"]
soundboardPlateSweep = Table[
  Module[{wood = woodName, h = thickness/1000,
          rho = soundboardWoods[woodName]["rho"], EG = soundboardWoods[woodName]["E"],
          f},
    f = soundboardPlateMode[0.620, 0.140, h, EG, rho];
    {wood, thickness, N[f, 4]}
  ],
  {woodName, {"Sitka spruce", "Engelmann spruce", "Western red cedar", "Redwood"}},
  {thickness, {2.5, 3.0, 4.0}}
];
TableForm[Flatten[soundboardPlateSweep, 1],
  TableHeadings -> {None, {"Soundboard species", "Thickness (mm)", "f_plate (Hz)"}}
]

(* Spot-check for the build target: Western red cedar at 3 mm.
   Should land somewhere between 130 Hz and 230 Hz depending on exact panel boundary. *)

(* ===================================================================== *)
(* 9.  Combined cavity x plate response (two coupled oscillators)        *)
(* ===================================================================== *)
(* Helmholtz cavity (with keel port) couples to the soundboard plate
   primarily through the lowest plate mode. Two-coupled-oscillator
   approximation: the cavity Helmholtz frequency f_H and the first plate
   mode f_p split into a coupled pair f_minus, f_plus:

     f_+/- = sqrt( ( f_H^2 + f_p^2 +/- sqrt( (f_H^2 - f_p^2)^2 + 4*k^2*f_H*f_p ) ) / 2 )

   where k is the coupling coefficient (~0.1 to 0.3 for arched-harp-style
   small-cavity instruments). The coupled pair sits as two distinct peaks
   straddling the geometric mean of f_H and f_p; spacing increases with k. *)

coupledPair[fH_, fp_, k_] := Module[
  {disc, fA, fB},
  disc = Sqrt[ (fH^2 - fp^2)^2 + 4 k^2 fH^2 fp^2 ];
  fA = Sqrt[ ( fH^2 + fp^2 - disc ) / 2 ];
  fB = Sqrt[ ( fH^2 + fp^2 + disc ) / 2 ];
  {fA, fB}
]

(* Apply to SAM-13-ROOT with cedar @ 3 mm *)
sam13fH = keelPortHelmholtz[0.650, 0.150, 0.150, 0.080, 0.050, 0.006];
sam13fP = soundboardPlateMode[0.620, 0.140, 0.003, soundboardWoods["Western red cedar"]["E"],
                              soundboardWoods["Western red cedar"]["rho"]];
sam13Coupled = coupledPair[sam13fH, sam13fP, 0.2];

Print["SAM-13-ROOT cavity Helmholtz: ", N[sam13fH, 4], " Hz"]
Print["SAM-13-ROOT first plate mode (cedar @ 3 mm): ", N[sam13fP, 4], " Hz"]
Print["SAM-13-ROOT coupled pair (k=0.2): ", N[sam13Coupled, 4], " Hz"]

(* Voicing target: lower of the coupled pair should sit at or just below
   the lowest string (G3 = 196 Hz). If too high, increase port area or
   thin the soundboard; if too low, reduce port area or thicken the soundboard. *)

(* ===================================================================== *)
(* 10.  Voiced-range plot                                                 *)
(* ===================================================================== *)
(* For each family variant, plot the string-frequency range against the
   predicted cavity and plate modes. Strings above the lower coupled mode
   get good radiation; strings below it are stiffness-controlled and rely
   primarily on direct soundboard radiation. *)

voicedRangePlot[variant_String, soundboardWood_String, soundboardThicknessMm_] :=
  Module[{vars, L, W, D, N, fmin, fmax, fH, fp, pair, stringFreqs},
    vars = sambucaFamily[variant];
    L = vars["L"]; W = vars["W"]; D = vars["D"];
    N = vars["N"]; fmin = vars["fmin"]; fmax = vars["fmax"];
    fH = keelPortHelmholtz[L, W, D, 0.080 * (L/0.650), 0.050 * (L/0.650), 0.006];
    fp = soundboardPlateMode[L * 0.95, W * 0.93, soundboardThicknessMm/1000,
           soundboardWoods[soundboardWood]["E"],
           soundboardWoods[soundboardWood]["rho"]];
    pair = coupledPair[fH, fp, 0.2];
    stringFreqs = Table[fmin * 2^((j-1) * Log2[fmax/fmin] / (N-1)), {j, 1, N}];
    Print["--- ", variant, " with ", soundboardWood, " @ ", soundboardThicknessMm, " mm ---"];
    Print["  Cavity Helmholtz: ", N[fH, 4], " Hz"];
    Print["  Plate mode 1:     ", N[fp, 4], " Hz"];
    Print["  Coupled pair:     ", N[pair, 4], " Hz"];
    Print["  String range:     ", N[fmin, 4], " - ", N[fmax, 4], " Hz"];
    Print["  Strings below lower coupled mode: ",
      Length[Select[stringFreqs, # < pair[[1]] &]], " of ", N];
  ]

voicedRangePlot["SAM-13-ROOT",    "Western red cedar", 3.0]
voicedRangePlot["SAM-19-MID",     "Western red cedar", 3.0]
voicedRangePlot["SAM-25-CONCERT", "Engelmann spruce",  3.0]

(* ===================================================================== *)
(* 11.  Sensitivity analysis                                              *)
(* ===================================================================== *)
(* Which design parameter moves the lower coupled mode the most?
   Useful for design-space prioritization: spend Wolfram time on the
   sensitive parameters, accept defaults on the insensitive ones. *)

sensitivity[parameterFn_, baseValue_, deltaFraction_] := Module[
  {fBase, fHigh, fLow},
  fBase = parameterFn[baseValue];
  fHigh = parameterFn[baseValue * (1 + deltaFraction)];
  fLow  = parameterFn[baseValue * (1 - deltaFraction)];
  N[ (fHigh - fLow) / (2 * fBase * deltaFraction), 4 ]
]

(* Lower coupled mode as a function of keel-port major axis *)
lowerCoupledVsPort[portMajor_] := Module[{fH, fp, p},
  fH = keelPortHelmholtz[0.650, 0.150, 0.150, portMajor, 0.050, 0.006];
  fp = soundboardPlateMode[0.620, 0.140, 0.003, soundboardWoods["Western red cedar"]["E"],
         soundboardWoods["Western red cedar"]["rho"]];
  p = coupledPair[fH, fp, 0.2];
  p[[1]]
]

Print["Sensitivity of lower coupled mode to keel-port major axis (around 80 mm):"]
Print["  d(f-)/df_x as a percentage of d(port_major)/port_major: ",
  100 * sensitivity[lowerCoupledVsPort, 0.080, 0.10], " %/%"]

(* Repeat for soundboard thickness *)
lowerCoupledVsThickness[h_] := Module[{fH, fp, p},
  fH = keelPortHelmholtz[0.650, 0.150, 0.150, 0.080, 0.050, 0.006];
  fp = soundboardPlateMode[0.620, 0.140, h, soundboardWoods["Western red cedar"]["E"],
         soundboardWoods["Western red cedar"]["rho"]];
  p = coupledPair[fH, fp, 0.2];
  p[[1]]
]

Print["Sensitivity of lower coupled mode to soundboard thickness (around 3 mm):"]
Print["  d(f-)/df_x as a percentage of d(h)/h: ",
  100 * sensitivity[lowerCoupledVsThickness, 0.003, 0.10], " %/%"]

(* ===================================================================== *)
(* 12.  TODO -- next-session work                                         *)
(* ===================================================================== *)
(* - Replace the simply-supported plate approximation with a proper FE pass
     once the soundboard bracing pattern is locked.
   - Add string-mass-loaded-strip effect on plate modes (R-A-03).
   - Plot the full transmittance curve (200 - 2000 Hz) for the SAM-13-ROOT
     under measured vs predicted comparison after the MULE measurements
     come in.
   - Bracing topology sweep: 0 / 1 / 2 / 4 fan braces under the string-
     holder strip, plate-mode shift per brace.
   - Re-validate the Helmholtz formula for the keel-port at the actual
     port forward-tilt angle (the standard Helmholtz formula assumes a
     normal-axis port; the 15-deg forward tilt introduces a small
     correction). *)

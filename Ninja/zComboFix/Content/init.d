/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_zComboFix_Init() {
    MEM_InitAll();

    // WRITE YOUR INITIALIZATIONS HERE
    Ninja_zComboFix_G12_PatchFightCombos();
};

func int oCAniCtrl_Human_IsInCombo (var int aniCtrlPtr) {
	//0x00628350 public: int __thiscall oCAniCtrl_Human::IsInCombo(void)
	const int oCAniCtrl_Human__IsInCombo_G1 = 6456144;

	//0x006B1430 public: int __thiscall oCAniCtrl_Human::IsInCombo(void)
	const int oCAniCtrl_Human__IsInCombo_G2 = 7017520;

	if (!aniCtrlPtr) { return FALSE; };

	var int retVal;

	const int call = 0;
	if (CALL_Begin (call)) {
		CALL_PutRetValTo (_@ (retVal));
		CALL__thiscall (_@ (aniCtrlPtr), MEMINT_SwitchG1G2 (oCAniCtrl_Human__IsInCombo_G1, oCAniCtrl_Human__IsInCombo_G2));
		call = CALL_End ();
	};

	return + retVal;
};

// ***************************
// Kampf - AI Human Master (4)
// ***************************

/*
MOVE_RUN Gegner in meinem Fokus + steht wer dazwischen?(G)
MOVE_RUNBACK Gegner in meinem Fokus
MOVE_JUMPBACK löst t_ParadeJumpB aus(Attacke wird nur pariert, wenn man schnell genug aus der W - Reichweite kommt !
MOVE_TURN Immer bis Gegner im Fokus(also nie durch neue Aktion unterbrochen, höchstens durch Gegner - Attacke)
MOVE_STRAFE(Richtung wird vom Programm entschieden)

MOVE_ATTACK in ComboZone = Combo / im Rennen = Sturmattacke

MOVE_SIDEATTACK Left -- > Right
MOVE_FRONTATTACK Left -- > Foward
oder Foward -- > Right

MOVE_TRIPLEATTACK Foward -- > Right -- > Left
oder Left -- > Right -- > Foward

MOVE_WHIRLATTACK Left -- > Right -- > Left -- > Right
MOVE_MASTERATTACK Left -- > Right -- > Foward -- > Foward -- > Foward -- > Foward

MOVE_PARADE
MOVE_STANDUP
MOVE_WAIT 200 ms
*/

// ************************************
// Meine Reaktionen auf Gegner-Aktionen
// ************************************

// ------ Gegner attackiert mich ------
instance FA_ENEMY_PREHIT_4(C_FightAI)
{
	move[0] = MOVE_PARADE;
};

// ------ Gegner macht Sturmattacke ------
instance FA_ENEMY_STORMPREHIT_4(C_FightAI)
{
	move[0] = MOVE_STRAFE;
};

// *******************************************
// Gegner in W-Reichweite (Treffer-Reichweite)
// *******************************************

// ------ Ich bin im Combo-Fenster ------
instance FA_MY_W_COMBO_4(C_FightAI)
{
	// --- Wird nie erreicht (Neue FAI-Bewertung erst wenn Ani zuende gespielt) ---
};

// ------ Ich renne auf den Gegner zu ------
instance FA_MY_W_RUNTO_4(C_FightAI)
{
	// move[0] = MOVE_WAIT; // --- Wait sorgt für besseres Parade-Fenster ---
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG (Stehenbleiben) ---
};

// ------- Ich Strafe gerade ------
instance FA_MY_W_STRAFE_4(C_FightAI)
{
	// --- Wird nie erreicht (Neue FAI-Bewertung erst wenn Ani zuende gespielt) ---
};

// ------- Ich habe Gegner im Fokus (kann treffen) -------
instance FA_MY_W_FOCUS_4(C_FightAI)
{
	// move[0] = MOVE_FRONTATTACK;
	// move[1] = MOVE_ATTACK;
	// move[2] = MOVE_WAIT; // --- Wait sorgt für besseres Parade-Fenster ---
    move[0] = MOVE_MASTERATTACK;
};

// ------- Ich habe Gegner NICHT im Fokus -------
instance FA_MY_W_NOFOCUS_4(C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};

// *************************************************
// Gegner in G-Reichweite (Sturmattacken-Reichweite)
// *************************************************

// ------ Ich bin im Combo-Fenster ------
instance FA_MY_G_COMBO_4(C_FightAI)
{
	// --- Wird nie erreicht (Neue FAI-Bewertung erst wenn Ani zuende gespielt) ---
};

// ------ Ich renne auf den Gegner zu (kann Sturmattacke machen) ------
instance FA_MY_G_RUNTO_4(C_FightAI)
{
	move[0] = MOVE_RUN;
};

// ------- Ich Strafe gerade ------
instance FA_MY_G_STRAFE_4(C_FightAI)
{
	// --- Wird nie erreicht (Neue FAI-Bewertung erst wenn Ani zuende gespielt) ---
};

// ------- Ich habe Gegner im Fokus -------
instance FA_MY_G_FOCUS_4(C_FightAI)
{
	move[0] = MOVE_RUN; // --- STANDARDEINTRAG ---
	move[1] = MOVE_STRAFE;
};

// ***************************************
// Gegner in FK-Reichweite (weit entfernt)
// ***************************************

// ------- Ich habe Gegner im Fokus -------
instance FA_MY_FK_FOCUS_4(C_FightAI)
{
	move[0] = MOVE_RUN; // --- STANDARDEINTRAG ---
};

// ------- Ich habe Gegner NICHT im Fokus (gilt auch für G-Distanz!) -------
instance FA_MY_G_FK_NOFOCUS_4(C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};

// ***********************************
// FAI für Fernkampf
// ---------------------------
// (wird bei jeder Entfernung benutzt)
// ***********************************

// ------ Gegner im Fokus ------
instance FA_MY_FK_FOCUS_FAR_4(C_FightAI)
{
	move[0] = MOVE_ATTACK; // --- STANDARDEINTRAG ---
};

// ------ Gegner NICHT im Fokus ------
instance FA_MY_FK_NOFOCUS_FAR_4(C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};

// ***********************************
// FAI für Magie
// ---------------------------
// (wird bei jeder Entfernung benutzt)
// ***********************************

// ------ Gegner im Fokus ------
instance FA_MY_FK_FOCUS_MAG_4(C_FightAI)
{
	move[0] = MOVE_ATTACK; // --- STANDARDEINTRAG ---
	move[1] = MOVE_Wait_EXT;
};

// ------ Gegner NICHT im Fokus -------
instance FA_MY_FK_NOFOCUS_MAG_4(C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};

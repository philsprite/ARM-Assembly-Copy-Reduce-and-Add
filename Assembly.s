// Lösung zu Aufgaben 3 und folgende
// Name: Matrikelnummer: 
// Name: Matrikelnummer: 
// Datum:
.file "aufgabe3.S"
.text       @ Legt eine Textsection für Programmcode und Konstanten an
.align 2    @ Sorgt dafür, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
.global main    @ Nimmt das Symbol main in die globale Symboltabelle auf
.type main,function
main:
    push {lr} @ Sichert die Rücksprungadresse und Register
    ldr R0, Adr_StringA @ Lädt die Adresse von StringA in R0
    ldr R1, Adr_StringB @ Lädt die Adresse von StringB in R1
    ldr R2, Adr_StringC @ Lädt die Adresse von StringC in R2

    bl kopieren   @ Ruft die Funktion zum Kopieren des Strings auf
    ldr r1, Adr_StringB @ Lädt die Adresse von StringB erneut in R1

    bl reduzieren @ Ruft die Funktion auf, um den String zu reduzieren
    ldr r2, Adr_StringC @ Lädt die Adresse von StringC erneut in R2

    bl addieren   @ Ruft die Funktion auf, um die Zahlen zu addieren

    pop {pc}      @ Stellt die ursprüngliche Rücksprungadresse wieder her und kehrt zurück

kopieren:	
    @ Kopiert den Inhalt von StringA nach StringB
    LDRB R4, [R0], #1 @ Lädt das nächste Zeichen von StringA und inkrementiert R0
    CMP R4, #0
    BEQ loop_kopieren @ Springt zum Ende, wenn das Nullzeichen erreicht ist
    STRB R4, [R1], #1 @ Speichert das Zeichen in StringB und inkrementiert R1
    B kopieren

loop_kopieren:
    MOV R4, #0    @ Setzt das Nullzeichen am Ende von StringB
    STRB R4, [R1]
    BX LR         @ Kehrt zur Hauptfunktion zurück

reduzieren:
    @ Modifiziert StringB, sodass nur Ziffern und Semikolons enthalten sind
    MOV R5, #0

    LDRB R5, [R1], #1 @ Lädt das nächste Zeichen von StringB und inkrementiert R1
    CMP R5, #0
    BEQ ende @ Beendet die Funktion, wenn das Nullzeichen erreicht ist

    CMP R5, #48
    BLT reduzieren @ Springt zurück, wenn das Zeichen kleiner als '0' ist

    CMP R5, #57
    BGT reduzieren @ Springt zurück, wenn das Zeichen größer als '9' ist
    STRB R5, [R2], #1 @ Speichert die Ziffer in StringC und inkrementiert R2
    b loop_reduzieren

loop_reduzieren:
    LDRB R5, [R1], #1
    CMP R5, #48
    BLT semikolon @ Fügt ein Semikolon ein, wenn das Zeichen kleiner als '0' ist

    CMP R5, #57
    BGT semikolon @ Fügt ein Semikolon ein, wenn das Zeichen größer als '9' ist

    STRB R5, [R2], #1 @ Speichert die Ziffer in StringC und inkrementiert R2
    B reduzieren

semikolon:
    MOV R5, #59 @ Setzt das Semikolon
    STRB R5, [R2], #1 @ Fügt ein Semikolon in StringC ein
    B reduzieren

ende:
    MOV R5, #0 @ Setzt das Nullzeichen am Ende von StringC
    STRB R5, [R2]
    BX LR @ Kehrt zur Hauptfunktion zurück

addieren:
    @ Addiert die Werte in StringC
    MOV R6, #0

step_add:
    MOV R7, #0
    LDRB R7, [R2], #1 @ Lädt das nächste Zeichen von StringC und inkrementiert R2
    CMP R7, #0
    BEQ loop_addieren @ Beendet die Schleife, wenn das Nullzeichen erreicht ist
    CMP R7, #59
    BEQ step_add @ Überspringt das Semikolon
    SUB R7, R7, #48 @ Konvertiert ASCII in Dezimal
    ADD R6, R6, R7 @ Addiert die Dezimalzahl zum Akkumulator R6
    B step_add

loop_addieren:
    STR R6, [R3] @ Speichert das Ergebnis der Addition in StringC
    BX lr @ Kehrt zur Hauptfunktion zurück

Adr_StringA: .word StringA @ Speichert die Adresse von StringA
Adr_StringB: .word StringB @ Speichert die Adresse von StringB
Adr_StringC: .word StringC @ Speichert die Adresse von StringC

.Lfe1:
.size main,.Lfe1-main

.data
StringA: .asciz "7p2p6" @ Initialer String

.comm StringB, 256 @ Reserviert Speicherplatz für StringB
.comm StringC, 256 @ Reserviert Speicherplatz für StringC

// End of File

*========================================
*	"Ninety-Nine Bottles of Beer"
*	A toy program, as written in
*	Microsoft Visual FoxPro 9.0
*	2019-09-17 Bd
*----------------------------------------
*	#toyprogrammingchallenge https://qoto.org/@Absinthe/102805659580967435
*	Code derived from/inspired by beer.py at https://git.qoto.org/Absinthe
*========================================
LOCAL lnBottles, lcBottles
lcBottles = bottletext(99)
FOR lnBottles = 99 TO 1 STEP -1
	? m.lcBottles + " of beer on the wall."
	? m.lcBottles + " of beer. Take one down,"
	lcBottles = bottletext(m.lnBottles - 1)
	? "pass it around... " + m.lcBottles + " of beer."
ENDFOR


*========================================
*	call num2name() and plural(),
*	then capitalize the result
*----------------------------------------
FUNCTION bottletext
LPARAMETERS pnBottles
	LOCAL lcCount, lcPlural, lcBottles
	lcCount  = num2name(m.pnBottles)
	lcPlural = "bottle" + plural(m.pnBottles)
	lcBottles = PROPER(m.lcCount) + " " + m.lcPlural
RETURN (m.lcBottles)


*========================================
*	num2name takes a number between 0-99
*	and returns the equivalent text
*	> no error handling
*	> assumes a valid number
*----------------------------------------
FUNCTION num2name
LPARAMETERS pnNum
	LOCAL ARRAY laTens[10]
	laTens[ 1] = ""
	laTens[ 2] = ""
	laTens[ 3] = "twenty"
	laTens[ 4] = "thirty"
	laTens[ 5] = "forty"
	laTens[ 6] = "fifty"
	laTens[ 7] = "sixty"
	laTens[ 8] = "seventy"
	laTens[ 9] = "eighty"
	laTens[10] = "ninety"

	LOCAL ARRAY laOnes[10]
	laOnes[ 1] = ""
	laOnes[ 2] = "one"
	laOnes[ 3] = "two"
	laOnes[ 4] = "three"
	laOnes[ 5] = "four"
	laOnes[ 6] = "five"
	laOnes[ 7] = "six"
	laOnes[ 8] = "seven"
	laOnes[ 9] = "eight"
	laOnes[10] = "nine"

	LOCAL ARRAY laTeens[10]
	laTeens[ 1] = "ten"
	laTeens[ 2] = "eleven"
	laTeens[ 3] = "twelve"
	laTeens[ 4] = "thirteen"
	laTeens[ 5] = "fourteen"
	laTeens[ 6] = "fifteen"
	laTeens[ 7] = "sixteen"
	laTeens[ 8] = "seventeen"
	laTeens[ 9] = "eighteen"
	laTeens[10] = "nineteen"

	LOCAL lnTen, lnOne
	lnTen = FLOOR(m.pnNum / 10)
	lnOne = (m.pnNum % 10)

	LOCAL lcName
	lcName = ""

	DO CASE
		**------------------------------
		* 99-20
		CASE (m.lnTen > 1)
			lcName = laTens[m.lnTen + 1]
			IF (m.lnOne > 0)
				lcName = lcName + "-" + laOnes[m.lnOne + 1]
			ENDIF
		**------------------------------
		* 19-10
		CASE (m.lnTen = 1)
			lcName = laTeens[m.lnOne + 1]
		**------------------------------
		* 9-0
		CASE (m.lnTen = 0)
			IF (m.lnOne = 0)
				lcName = "no"
			ELSE
				lcName = laOnes[m.lnOne + 1]
			ENDIF
		**------------------------------
	ENDCASE
*	DEBUGOUT m.lnTen, m.lnOne, "Name:", m.lcName
RETURN (m.lcName)


*========================================
*	plural: just "return 's' if not 1"
*----------------------------------------
FUNCTION plural
LPARAMETERS pnNumber
RETURN IIF(m.pnNumber = 1, "", "s")


*========================================
*	EOF
*========================================

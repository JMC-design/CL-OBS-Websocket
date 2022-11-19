(in-package :cl-obs-websocket)
(defparameter *keys* 
  #(:NONE

    :RETURN
    :ENTER
    :ESCAPE
    :TAB
    :BACKTAB
    :BACKSPACE
    :INSERT
    :DELETE
    :PAUSE
    :PRINT
    :SYSREQ
    :CLEAR
    :HOME
    :END
    :LEFT
    :UP
    :RIGHT
    :DOWN
    :PAGEUP
    :PAGEDOWN

    :SHIFT
    :CONTROL
    :META
    :ALT
    :ALTGR
    :CAPSLOCK
    :NUMLOCK
    :SCROLLLOCK

    :F1
    :F2
    :F3
    :F4
    :F5
    :F6
    :F7
    :F8
    :F9
    :F10
    :F11
    :F12
    :F13
    :F14
    :F15
    :F16
    :F17
    :F18
    :F19
    :F20
    :F21
    :F22
    :F23
    :F24
    :F25
    :F26
    :F27
    :F28
    :F29
    :F30
    :F31
    :F32
    :F33
    :F34
    :F35

    :MENU
    :HYPER-L
    :HYPER-R
    :HELP
    :DIRECTION-L
    :DIRECTION-R

    :SPACE
    :EXCLAM
    :QUOTEDBL
    :NUMBERSIGN
    :DOLLAR
    :PERCENT
    :AMPERSAND
    :APOSTROPHE
    :PARENLEFT
    :PARENRIGHT
    :ASTERISK
    :PLUS
    :COMMA
    :MINUS
    :PERIOD
    :SLASH
    :0
    :1
    :2
    :3
    :4
    :5
    :6
    :7
    :8
    :9
    :NUMEQUAL
    :NUMASTERISK
    :NUMPLUS
    :NUMCOMMA
    :NUMMINUS
    :NUMPERIOD
    :NUMSLASH
    :NUM0
    :NUM1
    :NUM2
    :NUM3
    :NUM4
    :NUM5
    :NUM6
    :NUM7
    :NUM8
    :NUM9
    :COLON
    :SEMICOLON
    :QUOTE
    :LESS
    :EQUAL
    :GREATER
    :QUESTION
    :AT
    :A
    :B
    :C
    :D
    :E
    :F
    :G
    :H
    :I
    :J
    :K
    :L
    :M
    :N
    :O
    :P
    :Q
    :R
    :S
    :T
    :U
    :V
    :W
    :X
    :Y
    :Z
    :BRACKETLEFT
    :BACKSLASH
    :BRACKETRIGHT
    :ASCIICIRCUM
    :UNDERSCORE
    :QUOTELEFT
    :BRACELEFT
    :BAR
    :BRACERIGHT
    :ASCIITILDE
    :NOBREAKSPACE
    :EXCLAMDOWN
    :CENT
    :STERLING
    :CURRENCY
    :YEN
    :BROKENBAR
    :SECTION
    :DIAERESIS
    :COPYRIGHT
    :ORDFEMININE
    :GUILLEMOTLEFT
    :NOTSIGN
    :HYPHEN
    :REGISTERED
    :MACRON
    :DEGREE
    :PLUSMINUS
    :TWOSUPERIOR
    :THREESUPERIOR
    :ACUTE
    :MU
    :PARAGRAPH
    :PERIODCENTERED
    :CEDILLA
    :ONESUPERIOR
    :MASCULINE
    :GUILLEMOTRIGHT
    :ONEQUARTER
    :ONEHALF
    :THREEQUARTERS
    :QUESTIONDOWN
    :AGRAVE
    :AACUTE
    :ACIRCUMFLEX
    :ATILDE
    :ADIAERESIS
    :ARING
    :AE
    :CCEDILLA
    :EGRAVE
    :EACUTE
    :ECIRCUMFLEX
    :EDIAERESIS
    :IGRAVE
    :IACUTE
    :ICIRCUMFLEX
    :IDIAERESIS
    :ETH
    :NTILDE
    :OGRAVE
    :OACUTE
    :OCIRCUMFLEX
    :OTILDE
    :ODIAERESIS
    :MULTIPLY
    :OOBLIQUE
    :UGRAVE
    :UACUTE
    :UCIRCUMFLEX
    :UDIAERESIS
    :YACUTE
    :THORN
    :SSHARP
    :DIVISION
    :YDIAERESIS
    :MULTI-KEY
    :CODEINPUT
    :SINGLECANDIDATE
    :MULTIPLECANDIDATE
    :PREVIOUSCANDIDATE
    :MODE-SWITCH
    :KANJI
    :MUHENKAN
    :HENKAN
    :ROMAJI
    :HIRAGANA
    :KATAKANA
    :HIRAGANA-KATAKANA
    :ZENKAKU
    :HANKAKU
    :ZENKAKU-HANKAKU
    :TOUROKU
    :MASSYO
    :KANA-LOCK
    :KANA-SHIFT
    :EISU-SHIFT
    :EISU-TOGGLE
    :HANGUL
    :HANGUL-START
    :HANGUL-END
    :HANGUL-HANJA
    :HANGUL-JAMO
    :HANGUL-ROMAJA
    :HANGUL-JEONJA
    :HANGUL-BANJA
    :HANGUL-PREHANJA
    :HANGUL-POSTHANJA
    :HANGUL-SPECIAL
    :DEAD-GRAVE
    :DEAD-ACUTE
    :DEAD-CIRCUMFLEX
    :DEAD-TILDE
    :DEAD-MACRON
    :DEAD-BREVE
    :DEAD-ABOVEDOT
    :DEAD-DIAERESIS
    :DEAD-ABOVERING
    :DEAD-DOUBLEACUTE
    :DEAD-CARON
    :DEAD-CEDILLA
    :DEAD-OGONEK
    :DEAD-IOTA
    :DEAD-VOICED-SOUND
    :DEAD-SEMIVOICED-SOUND
    :DEAD-BELOWDOT
    :DEAD-HOOK
    :DEAD-HORN
    :BACK
    :FORWARD
    :STOP
    :REFRESH
    :VOLUMEDOWN
    :VOLUMEMUTE
    :VOLUMEUP
    :BASSBOOST
    :BASSUP
    :BASSDOWN
    :TREBLEUP
    :TREBLEDOWN
    :MEDIAPLAY
    :MEDIASTOP
    :MEDIAPREVIOUS
    :MEDIANEXT
    :MEDIARECORD
    :MEDIAPAUSE
    :MEDIATOGGLEPLAYPAUSE
    :HOMEPAGE
    :FAVORITES
    :SEARCH
    :STANDBY
    :OPENURL
    :LAUNCHMAIL
    :LAUNCHMEDIA
    :LAUNCH0
    :LAUNCH1
    :LAUNCH2
    :LAUNCH3
    :LAUNCH4
    :LAUNCH5
    :LAUNCH6
    :LAUNCH7
    :LAUNCH8
    :LAUNCH9
    :LAUNCHA
    :LAUNCHB
    :LAUNCHC
    :LAUNCHD
    :LAUNCHE
    :LAUNCHF
    :LAUNCHG
    :LAUNCHH
    :MONBRIGHTNESSUP
    :MONBRIGHTNESSDOWN
    :KEYBOARDLIGHTONOFF
    :KEYBOARDBRIGHTNESSUP
    :KEYBOARDBRIGHTNESSDOWN
    :POWEROFF
    :WAKEUP
    :EJECT
    :SCREENSAVER
    :WWW
    :MEMO
    :LIGHTBULB
    :SHOP
    :HISTORY
    :ADDFAVORITE
    :HOTLINKS
    :BRIGHTNESSADJUST
    :FINANCE
    :COMMUNITY
    :AUDIOREWIND
    :BACKFORWARD
    :APPLICATIONLEFT
    :APPLICATIONRIGHT
    :BOOK
    :CD
    :CALCULATOR
    :TODOLIST
    :CLEARGRAB
    :CLOSE
    :COPY
    :CUT
    :DISPLAY
    :DOS
    :DOCUMENTS
    :EXCEL
    :EXPLORER
    :GAME
    :GO
    :ITOUCH
    :LOGOFF
    :MARKET
    :MEETING
    :MENUKB
    :MENUPB
    :MYSITES
    :NEWS
    :OFFICEHOME
    :OPTION
    :PASTE
    :PHONE
    :CALENDAR
    :REPLY
    :RELOAD
    :ROTATEWINDOWS
    :ROTATIONPB
    :ROTATIONKB
    :SAVE
    :SEND
    :SPELL
    :SPLITSCREEN
    :SUPPORT
    :TASKPANE
    :TERMINAL
    :TOOLS
    :TRAVEL
    :VIDEO
    :WORD
    :XFER
    :ZOOMIN
    :ZOOMOUT
    :AWAY
    :MESSENGER
    :WEBCAM
    :MAILFORWARD
    :PICTURES
    :MUSIC
    :BATTERY
    :BLUETOOTH
    :WLAN
    :UWB
    :AUDIOFORWARD
    :AUDIOREPEAT
    :AUDIORANDOMPLAY
    :SUBTITLE
    :AUDIOCYCLETRACK
    :TIME
    :HIBERNATE
    :VIEW
    :TOPMENU
    :POWERDOWN
    :SUSPEND
    :CONTRASTADJUST
    :MEDIALAST
    :CALL
    :CAMERA
    :CAMERAFOCUS
    :CONTEXT1
    :CONTEXT2
    :CONTEXT3
    :CONTEXT4
    :FLIP
    :HANGUP
    :NO
    :SELECT
    :YES
    :TOGGLECALLHANGUP
    :VOICEDIAL
    :LASTNUMBERREDIAL
    :EXECUTE
    :PRINTER
    :PLAY
    :SLEEP
    :ZOOM
    :CANCEL

    ;; #ifndef OBS-MOUSE-BUTTON
    ;; #define OBS-MOUSE-BUTTON(x OBS-HOTKEY(x
    ;; #define OBS-MOUSE-BUTTON-DEFAULT 1
    ;; #endif
    :MOUSE1
    :MOUSE2
    :MOUSE3
    :MOUSE4
    :MOUSE5
    :MOUSE6
    :MOUSE7
    :MOUSE8
    :MOUSE9
    :MOUSE10
    :MOUSE11
    :MOUSE12
    :MOUSE13
    :MOUSE14
    :MOUSE15
    :MOUSE16
    :MOUSE17
    :MOUSE18
    :MOUSE19
    :MOUSE20
    :MOUSE21
    :MOUSE22
    :MOUSE23
    :MOUSE24
    :MOUSE25
    :MOUSE26
    :MOUSE27
    :MOUSE28
    :MOUSE29
    ;; #ifdef OBS-MOUSE-BUTTON-DEFAULT
    ;; #undef OBS-MOUSE-BUTTON
    ;; #undef OBS-MOUSE-BUTTON-DEFAULT
    ;; #endif

    :BACKSLASH-RT102

    :OPEN
    :FIND
    :REDO
    :UNDO
    :FRONT
    :PROPS

    :VK-CANCEL
    :0x07
    :0x0A
    :0x0B
    :0x0E
    :0x0F
    :0x16
    :VK-JUNJA
    :VK-FINAL
    :0x1A
    :VK-ACCEPT
    :VK-MODECHANGE
    :VK-SELECT
    :VK-PRINT
    :VK-EXECUTE
    :VK-HELP
    :0x30
    :0x31
    :0x32
    :0x33
    :0x34
    :0x35
    :0x36
    :0x37
    :0x38
    :0x39
    :0x3A
    :0x3B
    :0x3C
    :0x3D
    :0x3E
    :0x3F
    :0x40
    :0x41
    :0x42
    :0x43
    :0x44
    :0x45
    :0x46
    :0x47
    :0x48
    :0x49
    :0x4A
    :0x4B
    :0x4C
    :0x4D
    :0x4E
    :0x4F
    :0x50
    :0x51
    :0x52
    :0x53
    :0x54
    :0x55
    :0x56
    :0x57
    :0x58
    :0x59
    :0x5A
    :VK-LWIN
    :VK-RWIN
    :VK-APPS
    :0x5E
    :VK-SLEEP
    :VK-SEPARATOR
    :0x88
    :0x89
    :0x8A
    :0x8B
    :0x8C
    :0x8D
    :0x8E
    :0x8F
    :VK-OEM-FJ-JISHO
    :VK-OEM-FJ-LOYA
    :VK-OEM-FJ-ROYA
    :0x97
    :0x98
    :0x99
    :0x9A
    :0x9B
    :0x9C
    :0x9D
    :0x9E
    :0x9F
    :VK-LSHIFT
    :VK-RSHIFT
    :VK-LCONTROL
    :VK-RCONTROL
    :VK-LMENU
    :VK-RMENU
    :VK-BROWSER-BACK
    :VK-BROWSER-FORWARD
    :VK-BROWSER-REFRESH
    :VK-BROWSER-STOP
    :VK-BROWSER-SEARCH
    :VK-BROWSER-FAVORITES
    :VK-BROWSER-HOME
    :VK-VOLUME-MUTE
    :VK-VOLUME-DOWN
    :VK-VOLUME-UP
    :VK-MEDIA-NEXT-TRACK
    :VK-MEDIA-PREV-TRACK
    :VK-MEDIA-STOP
    :VK-MEDIA-PLAY-PAUSE
    :VK-LAUNCH-MAIL
    :VK-LAUNCH-MEDIA-SELECT
    :VK-LAUNCH-APP1
    :VK-LAUNCH-APP2
    :0xB8
    :0xB9
    :0xC1
    :0xC2
    :0xC3
    :0xC4
    :0xC5
    :0xC6
    :0xC7
    :0xC8
    :0xC9
    :0xCA
    :0xCB
    :0xCC
    :0xCD
    :0xCE
    :0xCF
    :0xD0
    :0xD1
    :0xD2
    :0xD3
    :0xD4
    :0xD5
    :0xD6
    :0xD7
    :0xD8
    :0xD9
    :0xDA
    :VK-OEM-8
    :0xE0
    :VK-OEM-AX
    :VK-ICO-HELP
    :VK-ICO-00
    :VK-PROCESSKEY
    :VK-ICO-CLEAR
    :VK-PACKET
    :0xE8
    :VK-OEM-RESET
    :VK-OEM-JUMP
    :VK-OEM-PA1
    :VK-OEM-PA2
    :VK-OEM-PA3
    :VK-OEM-WSCTRL
    :VK-OEM-CUSEL
    :VK-OEM-ATTN
    :VK-OEM-FINISH
    :VK-OEM-COPY
    :VK-OEM-AUTO
    :VK-OEM-ENLW
    :VK-ATTN
    :VK-CRSEL
    :VK-EXSEL
    :VK-EREOF
    :VK-PLAY
    :VK-ZOOM
    :VK-NONAME
    :VK-PA1
    :VK-OEM-CLEAR))
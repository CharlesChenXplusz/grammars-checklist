lexer grammar ChecklistLexer;

TAG_OPEN
    : '<' -> pushMode(TAG)
    ;

SEA_WS
    :  (' '|'\t'|'\r'? '\n')+
    ;

TEXT
    : ~'<'+
    ;

mode TAG;

TAG_EQUALS
    : '=' -> pushMode(ATTVALUE)  ;

TAG_CLOSE
    : '>' -> popMode
    ;

TAG_SLASH
    : '/'
    ;

TAG_SLASH_CLOSE
    : '/>' -> popMode
    ;

TAG_WHITESPACE
    : [ \t\r\n] -> skip
    ;

CHECK_LIST
    : 'checklist'
    ;

CHECK_LIST_ITEM
    : 'checklistitem'
    ;

NAME
    : NameStartChar NameChar*
    ;

fragment
DIGIT
    : [0-9]
    ;
fragment
NameChar
    : NameStartChar
    | '-'
    | '_'
    | '.'
    | DIGIT
    |   '\u00B7'
    |   '\u0300'..'\u036F'
    |   '\u203F'..'\u2040'
    ;

fragment
NameStartChar
    :   [:a-zA-Z]
    |   '\u2070'..'\u218F'
    |   '\u2C00'..'\u2FEF'
    |   '\u3001'..'\uD7FF'
    |   '\uF900'..'\uFDCF'
    |   '\uFDF0'..'\uFFFD'
    ;

//
// attribute values
//
mode ATTVALUE;

// an attribute value may have spaces b/t the '=' and the value
ATTVALUE_VALUE
    : [ ]* ATTRIBUTE -> popMode
    ;

ATTRIBUTE
    : DOUBLE_QUOTE_STRING
    | SINGLE_QUOTE_STRING
    | ATTCHARS
    | HEXCHARS
    | DECCHARS
    ;


fragment ATTCHAR
    : '-'
    | '_'
    | '.'
    | '/'
    | '+'
    | ','
    | '?'
    | '='
    | ':'
    | ';'
    | '#'
    | [0-9a-zA-Z]
    ;

fragment ATTCHARS
    : ATTCHAR+ ' '?
    ;

fragment HEXCHARS
    : '#' [0-9a-fA-F]+
    ;

fragment DECCHARS
    : [0-9]+ '%'?
    ;

fragment DOUBLE_QUOTE_STRING
    : '"' ~[<"]* '"'
    ;

fragment SINGLE_QUOTE_STRING
    : '\'' ~[<']* '\''
    ;

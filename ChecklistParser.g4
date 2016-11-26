parser grammar ChecklistParser;

options { tokenVocab=ChecklistLexer; }

start :
        (checklist) *
        ;

checklist :
        TAG_OPEN CHECK_LIST attribute* TAG_CLOSE chardata* checklistitem+ TAG_OPEN TAG_SLASH CHECK_LIST TAG_CLOSE;

checklistitem:
        TAG_OPEN CHECK_LIST_ITEM attribute* TAG_CLOSE chardata*  TAG_OPEN TAG_SLASH CHECK_LIST_ITEM TAG_CLOSE chardata*;

attribute
        : attributeName TAG_EQUALS attributeValue
        | attributeName
        ;

attributeName
    : NAME
    ;

attributeValue
    : ATTVALUE_VALUE
    ;

chardata
    : TEXT
    | SEA_WS
    ;


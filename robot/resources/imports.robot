*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     json

Resource    ${CURDIR}/../keywords/keywords.robot
Variables   ${CURDIR}/testdata/common.yaml
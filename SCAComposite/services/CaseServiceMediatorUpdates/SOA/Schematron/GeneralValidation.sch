<?xml version="1.0" encoding="UTF-8" ?>
<schema xmlns="http://www.ascc.net/xml/schematron">
  <ns uri="http://xmlns.amis.nl/edesk/frm/0200" prefix="frm" />
  <ns uri="http://xmlns.amis.nl/edesk/common" prefix="com" />
  
  <pattern name="Minimal of one natural subject">
    <rule context="//frm:object/frm:subjectDetails">
      <assert test="count(com:naturalPerson) != 0">Form need a minimal of one natural subject</assert>
    </rule>
  </pattern>
</schema>
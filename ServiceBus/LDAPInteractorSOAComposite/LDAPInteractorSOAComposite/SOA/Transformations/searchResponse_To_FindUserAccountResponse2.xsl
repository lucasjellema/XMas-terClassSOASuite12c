<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns0="http://platform.integration.oracle/blocks/adapter/fw/metadata/ReadLDAPEntry"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:tns="saibot.airport/security"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns xp20 oraxsl mhdr oraext dvm xref socket"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/ldap/LDAPInteractorSOAComposite/LDAPInteractorSOAComposite/ReadLDAPEntry"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns2="http://oracle.com/sca/soapservice/LDAPAccessor/LDAPAccessor/LdapService">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/ReadLDAPEntry.wsdl"/>
        <oracle-xsl-mapper:rootElement name="searchResponse"
                                       namespace="http://platform.integration.oracle/blocks/adapter/fw/metadata/ReadLDAPEntry"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/LdapService.wsdl"/>
        <oracle-xsl-mapper:rootElement name="FindUserAccountResponse" namespace="saibot.airport/security"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [SAT DEC 13 12:51:44 CET 2014].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:FindUserAccountResponse>
      <tns:EmailAddress>
        <xsl:value-of select="/ns0:searchResponse/searchResultEntry/mail/value"/>
      </tns:EmailAddress>
      <tns:EmployeeNumber>
        <xsl:value-of select="/ns0:searchResponse/searchResultEntry/employeeNumber"/>
      </tns:EmployeeNumber>
      <tns:OrganizationUnit>
        <xsl:value-of select="/ns0:searchResponse/searchResultEntry/ou/value"/>
      </tns:OrganizationUnit>
      <tns:ManagerId>
        <xsl:value-of select="/ns0:searchResponse/searchResultEntry/manager/value"/>
      </tns:ManagerId>
      <tns:MobileTelephone>
        <xsl:value-of select="/ns0:searchResponse/searchResultEntry/mobile/value"/>
      </tns:MobileTelephone>
    </tns:FindUserAccountResponse>
  </xsl:template>
</xsl:stylesheet>

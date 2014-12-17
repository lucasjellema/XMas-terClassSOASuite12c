<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:ns1="http://xmlns.amis.nl/edesk/webformservice/properties"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://xmlns.amis.nl/edesk/frm/0200"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns1 ns0 oraxsl xp20 xref mhdr oraext dvm socket"
                xmlns:ns5="http://xmlns.amis.nl/edesk/common"
                xmlns:ns2="http://schemas.xmlsoap.org/ws/2003/03/addressing"
                xmlns:ns4="http://schemas.oracle.com/service/bpel/common"
                xmlns:tns="http://xmlns.amis.nl/edesk/webformservice"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:ns3="http://schemas.oracle.com/bpel/extension">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="oramds:/apps/WebFormEOL/WSDL/webformService.wsdl"/>
        <oracle-xsl-mapper:rootElement name="FormRequest" namespace="http://xmlns.amis.nl/edesk/frm/0200"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="oramds:/apps/WebFormEOL/WSDL/webformService.wsdl"/>
        <oracle-xsl-mapper:rootElement name="FormAnswer" namespace="http://xmlns.amis.nl/edesk/frm/0200"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [MON DEC 15 10:24:04 CET 2014].-->
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <ns0:FormAnswer>
      <ns5:messageDetails>
        <ns5:messageType>
          <xsl:value-of select="/ns0:FormRequest/ns5:messageDetails/ns5:messageType"/>
        </ns5:messageType>
        <ns5:owner>
          <xsl:value-of select="/ns0:FormRequest/ns5:messageDetails/ns5:owner"/>
        </ns5:owner>
        <ns5:sendDate>
          <xsl:value-of select="/ns0:FormRequest/ns5:messageDetails/ns5:sendDate"/>
        </ns5:sendDate>
        <ns5:sender>
          <ns5:organisation>
            <xsl:value-of select="/ns0:FormRequest/ns5:messageDetails/ns5:sender/ns5:organisation"/>
          </ns5:organisation>
          <ns5:application>
            <xsl:value-of select="/ns0:FormRequest/ns5:messageDetails/ns5:sender/ns5:application"/>
          </ns5:application>
          <xsl:if test="/ns0:FormRequest/ns5:messageDetails/ns5:sender/ns5:user">
            <ns5:user>
              <xsl:value-of select="/ns0:FormRequest/ns5:messageDetails/ns5:sender/ns5:user"/>
            </ns5:user>
          </xsl:if>
          <xsl:if test="/ns0:FormRequest/ns5:messageDetails/ns5:sender/ns5:action">
            <ns5:action>
              <xsl:value-of select="/ns0:FormRequest/ns5:messageDetails/ns5:sender/ns5:action"/>
            </ns5:action>
          </xsl:if>
        </ns5:sender>
      </ns5:messageDetails>
      <ns0:answer>
        <ns0:object>
          <ns0:processId>0</ns0:processId>
          <ns0:intakeId>
            <xsl:value-of select="/ns0:FormRequest/ns5:intakeDetails/ns5:intakeId"/>
          </ns0:intakeId>
          <xsl:if test="/ns0:FormRequest/ns5:intakeDetails/ns5:caseid">
            <ns0:caseId>
              <xsl:value-of select="/ns0:FormRequest/ns5:intakeDetails/ns5:caseid"/>
            </ns0:caseId>
          </xsl:if>
          <ns0:statusDetails>
            <ns0:statusCode>SOA-20400</ns0:statusCode>
            <ns0:statusMessage>Invalid host is accessing services</ns0:statusMessage>
          </ns0:statusDetails>
        </ns0:object>
      </ns0:answer>
    </ns0:FormAnswer>
  </xsl:template>
</xsl:stylesheet>

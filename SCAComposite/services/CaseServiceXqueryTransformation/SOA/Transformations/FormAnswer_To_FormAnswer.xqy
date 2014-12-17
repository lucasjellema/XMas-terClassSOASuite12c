xquery version "1.0" encoding "utf-8";

import schema namespace frm="http://xmlns.amis.nl/edesk/frm/0200" at "oramds:/apps/WebFormEOL/Messages/FRM/V2/form.msg.xsd";

declare namespace com = "http://xmlns.amis.nl/edesk/common";

import module namespace que="http://xmlns.amis.nl/query-functions" at "oramds:/apps/Libraries/CommonLibrary.xqy";

declare variable $in.payload as schema-element(frm:FormAnswer) external;

declare function local:mediatorTransform($in.payload as schema-element(frm:FormAnswer)) as schema-element(frm:FormAnswer) {
    validate {
        <frm:FormAnswer>
            <com:messageDetails>
                <com:messageType>{fn:data($in.payload/com:messageDetails/com:messageType)}</com:messageType>
                <com:owner>{que:sayHello($in.payload/com:messageDetails/com:owner)}</com:owner>
                <com:sendDate>{fn:data($in.payload/com:messageDetails/com:sendDate)}</com:sendDate>
                <com:sender>
                    <com:organisation>{fn:data($in.payload/com:messageDetails/com:sender/com:organisation)}</com:organisation>
                    <com:application>{fn:data($in.payload/com:messageDetails/com:sender/com:application)}</com:application>
                    {
                        if ($in.payload/com:messageDetails/com:sender/com:user)
                        then <com:user>{fn:data($in.payload/com:messageDetails/com:sender/com:user)}</com:user>
                        else ()
                    }
                    {
                        if ($in.payload/com:messageDetails/com:sender/com:action)
                        then <com:action>{fn:data($in.payload/com:messageDetails/com:sender/com:action)}</com:action>
                        else ()
                    }
                </com:sender>
            </com:messageDetails>
            {
                if ($in.payload/frm:answer)
                then 
                    <frm:answer>
                        {
                            for $object in $in.payload/frm:answer/frm:object
                            return 
                            <frm:object>
                                <frm:processId>{fn:data($object/frm:processId)}</frm:processId>
                                <frm:intakeId>{fn:data($object/frm:intakeId)}</frm:intakeId>
                                {
                                    if ($object/frm:caseId)
                                    then <frm:caseId>{fn:data($object/frm:caseId)}</frm:caseId>
                                    else ()
                                }
                                {
                                    if ($object/frm:properties)
                                    then 
                                        <frm:properties>
                                            {
                                                for $item in $object/frm:properties/frm:item
                                                return 
                                                <frm:item>
                                                    <frm:itemname>{fn:data($item/frm:itemname)}</frm:itemname>
                                                    {
                                                        if ($item/frm:itemtype)
                                                        then <frm:itemtype>{fn:data($item/frm:itemtype)}</frm:itemtype>
                                                        else ()
                                                    }
                                                    <frm:itemvalue>{fn:data($item/frm:itemvalue)}</frm:itemvalue>
                                                </frm:item>
                                            }
                                        </frm:properties>
                                    else ()
                                }
                                <frm:statusDetails>
                                    <frm:statusCode>{fn:data($object/frm:statusDetails/frm:statusCode)}</frm:statusCode>
                                    <frm:statusMessage>{fn:data($object/frm:statusDetails/frm:statusMessage)}</frm:statusMessage>
                                </frm:statusDetails>
                            </frm:object>
                        }
                    </frm:answer>
                else ()
            }
        </frm:FormAnswer>
    }
};

local:mediatorTransform($in.payload)

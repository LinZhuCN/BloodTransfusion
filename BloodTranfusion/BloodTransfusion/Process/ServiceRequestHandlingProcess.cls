/// 
Class BloodTransfusion.Process.ServiceRequestHandlingProcess Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='BloodTransfusion.Message.ServiceRequest' response='HIP.Message.HIPRESTResponse' height='2800' width='2000' >
<context>
<property name='patInstance' type='ODS.Patient' instantiate='0' />
<property name='entInstance' type='ODS.Encounter' instantiate='0' />
<property name='srcReqInstance' type='ODS.ServiceRequest' instantiate='0' />
<property name='tmpFlag' type='%String' instantiate='0' >
<annotation><![CDATA[Temp variable to use as a flag to indicate braches]]></annotation>
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='callResponse' type='HIP.Message.HIPRESTResponse' instantiate='0' />
<property name='tStream' type='%Stream.GlobalCharacter' instantiate='0' >
<annotation><![CDATA[Temporary steam object]]></annotation>
</property>
</context>
<sequence xend='200' yend='2000' >
<switch name='What is the operation' xpos='200' ypos='250' xend='200' yend='1900' >
<case condition='"Create" = request.operation' name='Create a Service Request' >
<call name='ReadPatient' target='ToHIP_REST接口' async='0' xpos='335' ypos='400' >
<request type='HIP.Message.HIPRESTRequest' >
<assign property="callrequest.Type" value="&quot;Patient&quot;" action="set" />
<assign property="callrequest.Operation" value="&quot;Read&quot;" action="set" />
<assign property="callrequest.Id" value="request.Patient.ResourceId" action="set" />
</request>
<response type='HIP.Message.HIPRESTResponse' >
<assign property="context.callResponse" value="callresponse" action="set" />
</response>
</call>
<if name='If Patient exists' condition='(("200" = context.callResponse.Code) &amp;&amp; ("" &apos;= context.callResponse.Payload))' xpos='335' ypos='500' xend='335' yend='750' >
<true>
<assign name="set flag as 1" property="context.tmpFlag" value="1" action="set" xpos='605' ypos='650' />
</true>
<false>
<sequence name='SavePatient' xpos='335' ypos='650' xend='200' yend='900' >
<code name='GetPatientStream' xpos='200' ypos='250' >
<![CDATA[ Do ##class(%ZEN.Auxiliary.jsonProvider).%WriteJSONStreamFromObject(.stm,request.Patient,,,1,"s")
 Set context.tStream=##class(%GlobalCharacterStream).%New()
 Do context.tStream.CopyFrom(stm)
 ]]>
</code>
<call name='SavePatientToODS' target='ToHIP_REST接口' async='0' xpos='200' ypos='350' >
<request type='HIP.Message.HIPRESTRequest' >
<assign property="callrequest.Type" value="&quot;Patient&quot;" action="set" />
<assign property="callrequest.Operation" value="&quot;Create&quot;" action="set" />
<assign property="callrequest.Payload" value="context.tStream" action="set" />
</request>
<response type='HIP.Message.HIPRESTResponse' >
<assign property="context.callResponse" value="callresponse" action="set" />
</response>
</call>
<if name='If Save Patient Succeed' condition='"200" = context.callResponse.Code' xpos='200' ypos='450' xend='200' yend='800' >
<true>
<assign name="set flag as 1" property="context.tmpFlag" value="1" action="set" xpos='200' ypos='600' />
</true>
<false>
<trace name='Create Patient Failed process' value='"TODO: 新增患者失败的处理流程 : "_ context.callResponse.Message' xpos='470' ypos='600' />
<assign name="set flag as 0" property="context.tmpFlag" value="0" action="set" xpos='470' ypos='700' />
</false>
</if>
</sequence>
</false>
</if>
<if name='Save Patient Succeed?' condition='context.tmpFlag' xpos='335' ypos='850' xend='335' yend='1800' >
<true>
<call name='ReadEncounter' target='ToHIP_REST接口' async='0' xpos='470' ypos='1000' >
<request type='HIP.Message.HIPRESTRequest' >
<assign property="callrequest.Type" value="&quot;Encounter&quot;" action="set" />
<assign property="callrequest.Operation" value="&quot;Read&quot;" action="set" />
<assign property="callrequest.Id" value="request.Encounter.ResourceId" action="set" />
</request>
<response type='HIP.Message.HIPRESTResponse' >
<assign property="context.callResponse" value="callresponse" action="set" />
</response>
</call>
<if name='If Encounter Exists' condition='(("200" = context.callResponse.Code) &amp;&amp; ("" &apos;= context.callResponse.Payload))' xpos='470' ypos='1100' xend='470' yend='1350' >
<true>
<assign name="set flag as 1" property="context.tmpFlag" value="1" action="set" xpos='740' ypos='1250' />
</true>
<false>
<sequence name='SaveEncounter' xpos='470' ypos='1250' xend='200' yend='900' >
<code name='GetEncounterStream' xpos='200' ypos='250' >
<![CDATA[ Do ##class(%ZEN.Auxiliary.jsonProvider).%WriteJSONStreamFromObject(.stm,request.Encounter,,,1,"s")
 Set context.tStream=##class(%GlobalCharacterStream).%New()
 Do context.tStream.CopyFrom(stm)
 ]]>
</code>
<call name='SaveEncounterToODS' target='ToHIP_REST接口' async='0' xpos='200' ypos='350' >
<request type='HIP.Message.HIPRESTRequest' >
<assign property="callrequest.Type" value="&quot;Encounter&quot;" action="set" />
<assign property="callrequest.Operation" value="&quot;Create&quot;" action="set" />
<assign property="callrequest.Payload" value="context.tStream" action="set" />
</request>
<response type='HIP.Message.HIPRESTResponse' >
<assign property="context.callResponse" value="callresponse" action="set" />
</response>
</call>
<if name='If Save Encounter Succeed' condition='"200" = context.callResponse.Code' xpos='200' ypos='450' xend='200' yend='800' >
<true>
<assign name="set flag as 1" property="context.tmpFlag" value="1" action="set" xpos='200' ypos='600' />
</true>
<false>
<trace name='Create Encounter Failed process' value='"TODO: 新增就诊失败的处理流程 : "_ context.callResponse.Message' xpos='470' ypos='600' />
<assign name="set flag as 0" property="context.tmpFlag" value="0" action="set" xpos='470' ypos='700' />
</false>
</if>
</sequence>
</false>
</if>
<if name='Save Encounter Succeed?' condition='context.tmpFlag' xpos='470' ypos='1450' xend='470' yend='1700' >
<true>
<trace value='"Encounter saved"' xpos='605' ypos='1600' />
</true>
</if>
</true>
</if>
</case>
<default name='default' />
</switch>
</sequence>
</process>
}

}

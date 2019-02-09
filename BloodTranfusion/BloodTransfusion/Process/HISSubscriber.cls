/// 
Class BloodTransfusion.Process.HISSubscriber Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='HIP.Message.Events.HIPResourceEventMsg' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='svcReqInst' type='ODS.ServiceRequest' instantiate='0' />
<property name='patInst' type='ODS.Patient' instantiate='0' />
<property name='entInst' type='ODS.Encounter' instantiate='0' />
<property name='tmpResp' type='HIP.Message.HIPRESTResponse' instantiate='0' />
<property name='HL7Msg' type='EnsLib.HL7.Message' instantiate='0' />
</context>
<sequence xend='200' yend='600' >
<switch name='AsType' xpos='200' ypos='250' xend='200' yend='500' >
<case condition='"ODS.ServiceRequest" = request.Type' name='IsServiceRequest' >
<sequence name='HandleServiceRequest' xpos='335' ypos='400' xend='200' yend='650' >
<call name='ReadServiceRequest' target='ToHIP_REST接口' async='0' xpos='200' ypos='250' >
<request type='HIP.Message.HIPRESTRequest' >
<assign property="callrequest.Type" value="&quot;ServiceRequest&quot;" action="set" />
<assign property="callrequest.Operation" value="&quot;Read&quot;" action="set" />
<assign property="callrequest.Id" value="request.ResourceId" action="set" />
</request>
<response type='HIP.Message.HIPRESTResponse' >
<assign property="context.tmpResp" value="callresponse" action="set" />
</response>
</call>
<code name='GetServiceRequestInst' xpos='200' ypos='350' >
<![CDATA[ set inst = ""
 do ##class(%ZEN.Auxiliary.jsonProvider).%ConvertJSONToObject(context.tmpResp.Payload, "ODS.ServiceRequest",.inst)
 set context.svcReqInst  = inst]]>
</code>
<transform name='GetOMBO27' class='BloodTransfusion.DT.ToHL7.ServiceRequestToOMBO27' source='context.svcReqInst' target='context.HL7Msg' xpos='477' ypos='333' />
<switch name='AsEvent' xpos='637' ypos='410' xend='466' yend='503' >
<case condition='"Created" = request.Event' name='IsCreated' >
<assign name="SetAsCreated" property="context.HL7Msg.{ORCgrp(1).ORC:OrderControl}" value="&quot;NW&quot;" action="set" xpos='852' ypos='498' />
</case>
<default name='default' />
</switch>
<call name='ToHIS' target='ToHIS_HL7文件接口' async='1' xpos='432' ypos='566' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.HL7Msg" action="set" />
</request>
<response type='Ens.Response' />
</call>
</sequence>
</case>
<default name='default' />
</switch>
</sequence>
</process>
}

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}

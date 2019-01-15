/// 
Class BloodTransfusion.Rule.BloodTransfusionV2HandlingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="BloodTransfusion.IntegrationProduction">
<ruleSet name="输血业务V2消息处理规则" effectiveBegin="" effectiveEnd="">
<rule name="用血申请处理规则">
<constraint name="docCategory" value="2.5.1"></constraint>
<constraint name="docName" value="OMB_O27"></constraint>
<when condition="1">
<send transform="BloodTransfusion.DT.V251.OMBO27ToHIPDTL" target="ToHIP_REST接口"></send>
<return></return>
</when>
</rule>
<rule name="用血医嘱处理规则" disabled="false">
<constraint name="docCategory" value="2.4"></constraint>
<constraint name="docName" value="OML_O21"></constraint>
<when condition="1">
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}

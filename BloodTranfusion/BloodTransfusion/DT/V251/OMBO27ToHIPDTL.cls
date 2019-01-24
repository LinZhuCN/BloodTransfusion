Class BloodTransfusion.DT.V251.OMBO27ToHIPDTL Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, BloodTransfusion.Message.ServiceRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='BloodTransfusion.Message.ServiceRequest' sourceDocType='2.5:OMB_O27' create='new' language='objectscript' >
<if condition='"NW" = source.{ORCgrp(1).ORC:OrderControl}' >
<true>
<assign value='"Create"' property='target.operation' action='set' />
</true>
<false>
<if condition='"CA" = source.{ORCgrp(1).ORC:OrderControl}' >
<true>
<assign value='"Update"' property='target.operation' action='set' />
</true>
</if>
</false>
</if>
<subtransform class='BloodTransfusion.DT.V251.SEG.PV1ToHIPEncounterDTL' targetObj='target.Encounter' sourceObj='source.{PIDgrp.PV1grp.PV1}' />
<subtransform class='BloodTransfusion.DT.V251.SEG.PIDToHIPPatientDTL' targetObj='target.Patient' sourceObj='source.{PIDgrp.PID}' />
<foreach property='source.{ORCgrp()}' key='k1' >
<subtransform class='BloodTransfusion.DT.V251.SEG.ORCToHIPServiceRequestDTL' targetObj='target.serviceReuqest.(k1)' sourceObj='source.{ORCgrp(k1).ORC}' />
<subtransform class='BloodTransfusion.DT.V251.SEG.BPOToHIPServiceRequestDT' targetObj='target.serviceReuqest.(k1)' sourceObj='source.{ORCgrp(k1).BPO}' />
<assign value='"1"' property='target.serviceReuqest.(k1).Subject.ResourceId' action='set' />
<assign value='"1"' property='target.serviceReuqest.(k1).Encounter.ResourceId' action='set' />
</foreach>
</transform>
}

}

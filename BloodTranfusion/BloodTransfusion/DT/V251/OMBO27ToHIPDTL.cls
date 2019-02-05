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
<subtransform class='BloodTransfusion.DT.V251.SEG.PV1ToHIPEncounterDTL' targetObj='target.batchServiceRequest.Encounter' sourceObj='source.{PIDgrp.PV1grp.PV1}' />
<subtransform class='BloodTransfusion.DT.V251.SEG.PIDToHIPPatientDTL' targetObj='target.batchServiceRequest.Patient' sourceObj='source.{PIDgrp.PID}' />
<foreach property='source.{ORCgrp()}' key='k1' >
<subtransform class='BloodTransfusion.DT.V251.SEG.ORCToHIPServiceRequestDTL' targetObj='target.batchServiceRequest.ServiceRequests.(k1)' sourceObj='source.{ORCgrp(k1).ORC}' />
<subtransform class='BloodTransfusion.DT.V251.SEG.BPOToHIPServiceRequestDT' targetObj='target.batchServiceRequest.ServiceRequests.(k1)' sourceObj='source.{ORCgrp(k1).BPO}' />
<foreach property='source.{ORCgrp(k1).NTE()}' key='k2' >
<subtransform class='BloodTransfusion.DT.V251.SEG.NTEToHIPNoteDTL' targetObj='target.batchServiceRequest.ServiceRequests.(k1).Notes.(k2)' sourceObj='source.{ORCgrp(k1).NTE(k2)}' />
</foreach>
<foreach property='source.{ORCgrp(k1).DG1()}' key='k3' >
<subtransform class='BloodTransfusion.DT.V251.SEG.DG1ToHIPDiagnosisDTL' targetObj='target.diagnoses.(k3)' sourceObj='source.{ORCgrp(k1).DG1(k3)}' />
<assign value='source.{PIDgrp.PV1grp.PV1:VisitNumber.IDNumber}' property='target.diagnoses.(k3).Encounter.ResourceId' action='set' />
</foreach>
<assign value='target.batchServiceRequest.Encounter' property='target.batchObservation.Encounter' action='set' />
<foreach property='source.{ORCgrp(k1).OBXgrp()}' key='k4' >
<subtransform class='BloodTransfusion.DT.V251.SEG.OBXToHIPObservationDTL' targetObj='target.batchObservation.Observations.(k4)' sourceObj='source.{ORCgrp(k1).OBXgrp(k4).OBX}' />
</foreach>
</foreach>
</transform>
}

}

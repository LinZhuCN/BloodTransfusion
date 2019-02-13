Class BloodTransfusion.DT.ToHL7.ServiceRequestToOMBO27 Extends Ens.DataTransformDTL [ DependsOn = (ODS.ServiceRequest, EnsLib.HL7.Message) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ODS.ServiceRequest' targetClass='EnsLib.HL7.Message' targetDocType='2.5.1:OMB_O27' create='new' language='objectscript' >
<subtransform class='BloodTransfusion.DT.ToHL7.SEQ.MSHBuilder' targetObj='target.{MSH}' sourceObj='source' />
<subtransform class='BloodTransfusion.DT.ToHL7.SEQ.PatientToPID' targetObj='target.{PIDgrp.PID}' sourceObj='source.Subject' />
<subtransform class='BloodTransfusion.DT.ToHL7.SEQ.EncounterToPV1' targetObj='target.{PIDgrp.PV1grp.PV1}' sourceObj='source.Encounter' />
<subtransform class='BloodTransfusion.DT.ToHL7.SEQ.ServiceRequestToORC' targetObj='target.{ORCgrp(1).ORC}' sourceObj='source' />
<subtransform class='BloodTransfusion.DT.ToHL7.SEQ.ServiceRequestToBPO' targetObj='target.{ORCgrp(1).BPO}' sourceObj='source' />
<if condition='"NW" = source.Status.Code' >
<true>
<foreach property='source.Notes()' key='k1' >
<subtransform class='BloodTransfusion.DT.ToHL7.SEQ.NoteToNTE' targetObj='target.{ORCgrp(1).NTE(k1)}' sourceObj='source.Notes.(k1)' />
</foreach>
<foreach property='source.Encounter.Diagnoses()' key='k2' >
<subtransform class='BloodTransfusion.DT.ToHL7.SEQ.DiagnosisToDG1' targetObj='target.{ORCgrp(1).DG1(k2)}' sourceObj='source.Encounter.Diagnoses.(k2)' />
</foreach>
<foreach property='source.Encounter.Observations()' key='k3' >
<subtransform class='BloodTransfusion.DT.ToHL7.SEQ.ObservationToOBX' targetObj='target.{ORCgrp(1).OBXgrp(k3).OBX}' sourceObj='source.Encounter.Observations.(k3)' />
</foreach>
</true>
</if>
</transform>
}

}

Class BloodTransfusion.DT.ToHL7.SEQ.DiagnosisToDG1 Extends Ens.DataTransformDTL [ DependsOn = (ODS.Diagnosis, EnsLib.HL7.Segment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ODS.Diagnosis' targetClass='EnsLib.HL7.Segment' targetDocType='2.5.1:DG1' create='new' language='objectscript' >
<assign value='source.ResourceId' property='target.{DiagnosisIdentifier.EntityIdentifier}' action='set' />
<assign value='source.GroupCode' property='target.{SetIDDG1}' action='set' />
<assign value='source.Description' property='target.{DiagnosisDescription}' action='set' />
<assign value='source.Code.System' property='target.{DiagnosisCodingMethod}' action='set' />
<assign value='source.Code.Code' property='target.{DiagnosisCodeDG1.Identifier}' action='set' />
<assign value='source.Code.Display' property='target.{DiagnosisCodeDG1.Text}' action='set' />
<assign value='source.Role.Code' property='target.{DiagnosisType}' action='set' />
</transform>
}

}

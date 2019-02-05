Class BloodTransfusion.DT.V251.SEG.DG1ToHIPDiagnosisDTL Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Segment, ODS.Diagnosis) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Segment' targetClass='ODS.Diagnosis' sourceDocType='2.5.1:DG1' create='new' language='objectscript' >
<assign value='source.{DiagnosisIdentifier.EntityIdentifier}' property='target.ResourceId' action='set' />
<assign value='source.{SetIDDG1}' property='target.GroupCode' action='set' />
<assign value='source.{DiagnosisDescription}' property='target.Description' action='set' />
<assign value='source.{DiagnosisCodingMethod}' property='target.Code.System' action='set' />
<assign value='source.{DiagnosisCodeDG1.Identifier}' property='target.Code.Code' action='set' />
<assign value='source.{DiagnosisCodeDG1.Text}' property='target.Code.Display' action='set' />
<assign value='source.{DiagnosisType}' property='target.Role.Code' action='set' />
<if condition='"" &apos;= source.{DiagnosisDateTime.Time}' >
<true>
<assign value='$zdh($e(source.{DiagnosisDateTime.Time},1,8),8)' property='target.OnsetTime' action='set' />
</true>
</if>
</transform>
}

}

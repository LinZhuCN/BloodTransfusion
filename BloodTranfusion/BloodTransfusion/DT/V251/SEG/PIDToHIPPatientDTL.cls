Class BloodTransfusion.DT.V251.SEG.PIDToHIPPatientDTL Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Segment, ODS.Patient) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Segment' targetClass='ODS.Patient' sourceDocType='2.5.1:PID' create='new' language='objectscript' >
<assign value='source.{PatientIdentifierList().IDNumber}' property='target.ResourceId' action='set' />
<foreach property='source.{PatientIdentifierList()}' key='k1' >
<assign value='source.{PatientIdentifierList(k1).IDNumber}' property='target.Identifier.(k1).Value' action='set' />
<assign value='source.{PatientIdentifierList(k1).IdentifierTypeCode}' property='target.Identifier.(k1).Type.Code' action='set' />
</foreach>
<assign value='source.{PatientName().GivenName}' property='target.Name.(1).Text' action='set' />
<assign value='source.{PatientName().FamilyName.Surname}' property='target.Name.(1).Prefix' action='set' />
<assign value='$zdh($e(source.{DateTimeofBirth.Time},1,8),8)' property='target.BirthDate' action='set' />
<assign value='source.{AdministrativeSex}' property='target.Gender' action='set' />
<assign value='source.{Race().Identifier}' property='target.Ethnic.Code' action='set' />
<assign value='source.{Race().Text}' property='target.Ethnic.Display' action='set' />
</transform>
}

}

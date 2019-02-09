Class BloodTransfusion.DT.ToHL7.SEQ.PatientToPID Extends Ens.DataTransformDTL [ DependsOn = (ODS.Patient, EnsLib.HL7.Segment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ODS.Patient' targetClass='EnsLib.HL7.Segment' targetDocType='2.5.1:PID' create='new' language='objectscript' >
<assign value='source.ResourceId' property='target.{PatientID.IDNumber}' action='set' />
<foreach property='source.Identifier()' key='k1' >
<assign value='source.Identifier.(k1).Type.Code' property='target.{PatientIdentifierList(k1).IdentifierTypeCode}' action='set' />
<assign value='source.Identifier.(k1).Value' property='target.{PatientIdentifierList(k1).IDNumber}' action='set' />
</foreach>
<assign value='source.Name.(1).Prefix' property='target.{PatientName().FamilyName.Surname}' action='set' />
<assign value='source.Name.(1).Text' property='target.{PatientName().GivenName}' action='set' />
<assign value='$zd(source.BirthDate,8)_"000000"' property='target.{DateTimeofBirth.Time}' action='set' />
<assign value='source.Gender' property='target.{AdministrativeSex}' action='set' />
<assign value='source.Ethnic.Code' property='target.{Race().Identifier}' action='set' />
</transform>
}

}

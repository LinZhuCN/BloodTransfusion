Class BloodTransfusion.DT.V251.SEG.PV1ToHIPEncounterDTL Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Segment, ODS.Encounter) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Segment' targetClass='ODS.Encounter' sourceDocType='2.5.1:PV1' create='new' language='objectscript' >
<assign value='source.{PatientClass}' property='target.Class.Code' action='set' />
<assign value='source.{AssignedPatientLocation.PointofCare}' property='target.Location.(1).Ward.Code' action='set' />
<assign value='source.{AssignedPatientLocation.Room}' property='target.Location.(1).Room' action='set' />
<assign value='source.{AssignedPatientLocation.Bed}' property='target.Location.(1).Bed' action='set' />
<assign value='source.{AssignedPatientLocation.Facility.NamespaceID}' property='target.Location.(1).Department.Code' action='set' />
<assign value='source.{AssignedPatientLocation.Facility.UniversalID}' property='target.Location.(1).Department.Display' action='set' />
<if condition='"" &apos;= source.{AdmitDateTime.Time}' >
<true>
<assign value='$zdh($e(source.{AdmitDateTime.Time},1,8),8)' property='target.Location.(1).Period.Start' action='set' />
</true>
</if>
<assign value='source.{PendingLocation.PointofCare}' property='target.Location.(1).Location.Identifier.(1).Value' action='set' />
<assign value='source.{AdmissionType}' property='target.Type.(1).Code' action='set' />
<assign value='source.{VisitNumber.IDNumber}' property='target.Identifier.Value' action='set' />
<assign value='source.{OtherHealthcareProvider().IDNumber}' property='target.Participant.(1).Identifier.(1).Value' action='set' />
<assign value='source.{OtherHealthcareProvider().GivenName}' property='target.Participant.(1).Name.Text' action='set' />
<assign value='source.{VisitIndicator}' property='target.Extension.VisitIndicator' action='set' />
</transform>
}

}

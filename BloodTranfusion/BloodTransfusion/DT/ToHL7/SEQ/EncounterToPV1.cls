Class BloodTransfusion.DT.ToHL7.SEQ.EncounterToPV1 Extends Ens.DataTransformDTL [ DependsOn = (ODS.Encounter, EnsLib.HL7.Segment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ODS.Encounter' targetClass='EnsLib.HL7.Segment' targetDocType='2.5.1:PV1' create='new' language='objectscript' >
<assign value='source.Class.Code' property='target.{PatientClass}' action='set' />
<assign value='source.Location.(1).Ward.Code' property='target.{AssignedPatientLocation.PointofCare}' action='set' />
<assign value='source.Location.(1).Room' property='target.{AssignedPatientLocation.Room}' action='set' />
<assign value='source.Location.(1).Bed' property='target.{AssignedPatientLocation.Bed}' action='set' />
<assign value='source.Location.(1).Department.Code' property='target.{AssignedPatientLocation.Facility.NamespaceID}' action='set' />
<assign value='source.Location.(1).Department.Display' property='target.{AssignedPatientLocation.Facility.UniversalID}' action='set' />
<if condition='"" &apos;= source.Location.(1).Period.Start' >
<true>
<assign value='$REPLACE($REPLACE($zdt(source.Location.(1).Period.Start,8,1)," ",""),":","")' property='target.{AdmitDateTime.Time}' action='set' />
</true>
</if>
<assign value='source.Location.(1).Location.Identifier.(1).Value' property='target.{PendingLocation.PointofCare}' action='set' />
<assign value='source.Type.(1).Code' property='target.{AdmissionType}' action='set' />
<assign value='source.ResourceId' property='target.{VisitNumber.IDNumber}' action='set' />
<assign value='source.Participant.(1).Identifier.(1).Value' property='target.{OtherHealthcareProvider().IDNumber}' action='set' />
<assign value='source.Participant.(1).Name.Text' property='target.{OtherHealthcareProvider().GivenName}' action='set' />
<assign value='source.Extension.VisitIndicator' property='target.{VisitIndicator}' action='set' />
</transform>
}

}

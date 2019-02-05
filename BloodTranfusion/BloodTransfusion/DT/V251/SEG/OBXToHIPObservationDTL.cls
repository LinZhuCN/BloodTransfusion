Class BloodTransfusion.DT.V251.SEG.OBXToHIPObservationDTL Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Segment, ODS.Observation) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Segment' targetClass='ODS.Observation' sourceDocType='2.5.1:OBX' create='new' language='objectscript' >
<assign value='source.{SetIDOBX}' property='target.ResourceId' action='set' />
<assign value='source.{SetIDOBX}' property='target.ObsId' action='set' />
<assign value='source.{SetIDOBX}' property='target.Identifier.Value' action='set' />
<assign value='source.{ObservationIdentifier.Identifier}' property='target.Code.Code' action='set' />
<assign value='source.{ObservationIdentifier.Text}' property='target.Code.Display' action='set' />
<assign value='source.{ObservationIdentifier.AlternateIdentifier}' property='target.Category.Code' action='set' />
<assign value='source.{ObservationIdentifier.AlternateText}' property='target.Category.Display' action='set' />
<assign value='source.{ObservationSubID}' property='target.SubId' action='set' />
<assign value='source.{ValueType}' property='target.ValueType' action='set' />
<foreach property='source.{ObservationValue()}' key='k1' >
<assign value='source.{ObservationValue(k1)}' property='target.Value.(k1)' action='set' />
</foreach>
<assign value='source.{ReferencesRange}' property='target.ReferenceRange.Text' action='set' />
<foreach property='source.{AbnormalFlags()}' key='k2' >
<assign value='source.{AbnormalFlags(k2)}' property='target.Interpretation.Display' action='set' />
</foreach>
<assign value='source.{ObservationResultStatus}' property='target.Status.Code' action='set' />
<assign value='$e(source.{DateTimeoftheObservation.Time},1,4)_"-"_$e(source.{DateTimeoftheObservation.Time},5,6)_"-"_$e(source.{DateTimeoftheObservation.Time},7,8)_" "_$e(source.{DateTimeoftheObservation.Time},9,10)_":"_$e(source.{DateTimeoftheObservation.Time},11,12)_":"_$e(source.{DateTimeoftheObservation.Time},13,14)' property='target.EffectiveDateTime' action='set' />
<assign value='source.{ResponsibleObserver().IDNumber}' property='target.Specimen.Type.Code' action='set' />
<assign value='source.{ResponsibleObserver().GivenName}' property='target.Specimen.ResultFlag' action='set' />
<assign value='source.{ResponsibleObserver().SecondandFurtherGivenNamesor}' property='target.Specimen.LowLevel' action='set' />
<assign value='source.{ResponsibleObserver().Suffix}' property='target.Specimen.HighLevel' action='set' />
<assign value='source.{Units.Text}' property='target.ValueUnits' action='set' />
</transform>
}

}

Class BloodTransfusion.DT.ToHL7.SEQ.NoteToNTE Extends Ens.DataTransformDTL [ DependsOn = (ODS.ServiceRequest.Note, EnsLib.HL7.Segment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ODS.ServiceRequest.Note' targetClass='EnsLib.HL7.Segment' targetDocType='2.5.1:NTE' create='new' language='objectscript' >
<assign value='source.Seq' property='target.{SetIDNTE}' action='set' />
<assign value='source.Comment.System' property='target.{CommentType.NameofCodingSystem}' action='set' />
<assign value='source.Comment.Code' property='target.{CommentType.Identifier}' action='set' />
<assign value='source.Comment.Display' property='target.{CommentType.Text}' action='set' />
</transform>
}

}

Class BloodTransfusion.Message.ServiceRequest Extends BloodTransfusion.Message.AbstractBusinessRequest
{

Property Patient As ODS.Patient;

Property Encounter As ODS.Encounter;

Property serviceReuqest As list Of ODS.ServiceRequest;

Storage Default
{
<Data name="ServiceRequestDefaultData">
<Subscript>"ServiceRequest"</Subscript>
<Value name="1">
<Value>Patient</Value>
</Value>
<Value name="2">
<Value>Encounter</Value>
</Value>
<Value name="3">
<Value>serviceReuqest</Value>
</Value>
</Data>
<DefaultData>ServiceRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}

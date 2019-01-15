Class HIP.Message.CreateServiceRequest Extends HIP.Message.AbstractOperativeRequest
{

Property Patient As ODS.Patient;

Property Encounter As ODS.Encounter;

Property serviceReuqest As list of ODS.ServiceRequest;

Storage Default
{
<Data name="CreateServiceRequestDefaultData">
<Subscript>"CreateServiceRequest"</Subscript>
<Value name="1">
<Value>Encounter</Value>
</Value>
<Value name="2">
<Value>serviceReuqest</Value>
</Value>
<Value name="3">
<Value>Patient</Value>
</Value>
</Data>
<DefaultData>CreateServiceRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}

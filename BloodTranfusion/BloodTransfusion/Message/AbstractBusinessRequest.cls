Class BloodTransfusion.Message.AbstractBusinessRequest Extends Ens.Request [ Abstract ]
{

Property operation As %String(VALUELIST = ",Create,Update,Delete,Read,Search");

Storage Default
{
<Data name="AbstractBusinessRequestDefaultData">
<Subscript>"AbstractBusinessRequest"</Subscript>
<Value name="1">
<Value>operation</Value>
</Value>
</Data>
<DefaultData>AbstractBusinessRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}

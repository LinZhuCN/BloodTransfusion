Class HIP.Message.AbstractOperativeRequest Extends Ens.Request [ Abstract ]
{

Property operation As %String(VALUELIST = ",create,update,delete");

Storage Default
{
<Data name="AbstractOperativeRequestDefaultData">
<Subscript>"AbstractOperativeRequest"</Subscript>
<Value name="1">
<Value>operation</Value>
</Value>
</Data>
<DefaultData>AbstractOperativeRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}

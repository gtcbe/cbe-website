function field_hide_label(p_field, p_labelID)
{
	if(!p_field.value)
	{
		var label = document.getElementById(p_labelID)
		label.style.visibility = "hidden";
	}
}

function field_show_label(p_field, p_labelID)
{
	if(!p_field.value)
	{
		var label = document.getElementById(p_labelID)
		label.style.visibility = "visible";
	}
}
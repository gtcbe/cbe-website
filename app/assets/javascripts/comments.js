var reply_form = null;

function insertAfter(referenceNode, newNode) 
{
    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
}

function post_comment(sender)
{
	var id = sender.getAttribute("comment_id");
	if(!reply_form)
	{
		reply_form = document.getElementById("new_comment");
	}
	document.getElementById("comment_commentable_id").setAttribute("value", id);
	document.getElementById("comment_commentable_type").setAttribute("value", "Comment");
	insertAfter(sender.parentNode.parentNode, reply_form);
}


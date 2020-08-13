 var headerSpec,s;
 headerSpec=new itemSpec("header","Record information","Object");
 headerSpec.expand=false;
 headerSpec.appendChild("title","Title","Text");
 headerSpec.appendChild("loc","Location","Text");
 headerSpec.appendChild("version","Version","Number");
 headerSpec.appendChild("updated","Updated","Date");
 headerSpec.appendChild("by","By","Text");
 headerSpec.appendChild("issued","Issued","Date");
 headerSpec.appendChild("issuedBy","By","Text");
 headerSpec.appendChild("document","Document","Boolean"); 
 headerSpec.appendChild("training","Training required","Boolean");
 headerSpec.appendChild("internet","Internet file","Boolean");
 headerSpec.appendChild("symlink","Symbolic link","Text");
 s=headerSpec.appendChild("comments","Comments","Array");
 s.appendChild("title","Title","Text");
 s.appendChild("comment","Comment","TextArea");
 s.appendChild("by","By","Text");
 s.appendChild("on","Date","Date");
 
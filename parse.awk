# This awk program adds <br> to the end of each line
# unless it's inside a codeblock.
# It also converts the custom <block> tag into
# the actual HTML we want
BEGIN {isCode=0}
{
    if ($0 == "<block>") {
        isCode = 1;
	printf("<pre><code class=\"block\">");
        next;
    }
    if ($0 == "</block>") {
        isCode = 0;
	print "</code></pre>";
	next;
    }
    if (isCode == 1){
        print $0;
    } else {
        print $0"<br>";
    }
}
END {}
fun diff_test(a,b) = abs(a-b) <0.0001;
fun search negpt pospt =
    let
      val midpt = (pospt + negpt) /2.0
    in
      if (diff_test(negpt,pospt) then midpt
      else if
    end
# Unlike most systems where the primitive type is a 32 or 64-bit integer,
# the primitive type in Cairo is "felt", which stands for "field element".
# When we say "a field element" we mean an integer in the range -P / 2 < x < P / 2,
# where P is a very large (prime) number.
# Currently we use a 252-bit number (76 decimal digits).
# When we add, subtract or multiply and the result is outside the range above,
# there is an overflow.
#
# The most important difference between integers and field elements is division:
# Division of field elements (and therefore division in Cairo) is not the
# integer division you may be used to.
# In the next challenge, you'll see how to use unsigned_div_rem()
# for truncated (i.e., rounding down) integer division.
#
# Make the code below output the results of the following expressions:
# 1. 1 + 100, 1 - 100, 9 * 9.
# 2. pow(10, 74), pow(10, 75), pow(10, 76)
# 3. 12 / 3, (-12) / 3
# 4. 13 / 3 (This is an example of division in the field)

%builtins output

# Computes base^exp.
func pow(base : felt, exp : felt) -> (res):
    if exp == 0:
        return (res=1)
    end

    let (res) = pow(base=base, exp=exp - 1)
    return (res=res * base)
end

func main(output_ptr : felt*) -> (output_ptr : felt*):
    assert [output_ptr] = 1 + 100
    assert [output_ptr + 1] = 1 - 100
    assert [output_ptr + 2] = 9 * 9
    let (val) = pow(base=10, exp=74)
    assert [output_ptr + 3] = val
    let (val) = pow(base=10, exp=75)
    assert [output_ptr + 4] = val
    let (val) = pow(base=10, exp=76)
    assert [output_ptr + 5] = val

    assert [output_ptr + 6] = 12 / 3
    assert [output_ptr + 7] = (-12) / 3
    assert [output_ptr + 8] = 13 / 3

    return (output_ptr=output_ptr + 9)
end


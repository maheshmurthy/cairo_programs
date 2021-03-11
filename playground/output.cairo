# The following code outputs the numbers 100, 200, 300.
# 1. Click on "Run" to see the output.
# 2. Change it to output 400 as well.
#    Don't forget to update the return value to output_ptr + 4
#    to indicate that the program returns 4 values.

# Use the output builtin.
%builtins output

func main(output_ptr : felt*) -> (output_ptr : felt*):
    # Output 100 by writing the value to the cell pointed by
    # output_ptr.
    assert [output_ptr] = 100
    # Output 200 by writing the value to the following cell.
    assert [output_ptr + 1] = 200
    # Output 300 by writing the value to the following cell.
    assert [output_ptr + 2] = 300
    assert [output_ptr + 3] = 400

    # Return the new output pointer.
    return (output_ptr=output_ptr + 4)
end


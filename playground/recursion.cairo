# The following code prints the sum of the numbers from 1 to 10.
# Modify the function `compute_sum` to print all the intermediate sums:
# 1, 1 + 2, 1 + 2 + 3, ..., 1 + 2 + ... + 10.

# Use the output builtin.
%builtins output

func compute_sum(output_ptr : felt*, n : felt) -> (output_ptr : felt*, sum : felt):
    if n == 0:
        # When 0 is reached, return 0.
        return (output_ptr=output_ptr, sum=0)
    end

    # Otherwise, call `compute_sum` recursively to compute 1 + 2 + ... + (n-1)
    let (output_ptr, sum) = compute_sum(output_ptr=output_ptr, n=n - 1)
    # Add the new value `n` to the sum.
    let new_sum = sum + n
    assert [output_ptr] = new_sum
    return (output_ptr=output_ptr+1, sum=new_sum)
end

func main(output_ptr : felt*) -> (output_ptr : felt*):
    let (output_ptr, res) = compute_sum(output_ptr=output_ptr, n=10)

    # Output the result.
    assert [output_ptr] = res
    return (output_ptr=output_ptr + 1)
end


# def call_block 
#     if true
#         yield
#     end
# end

# call_block { puts "this is real" }

def block_parameter
    yield(1,2,3,4,5)
end

block_parameter { |a, b=1, *c|
    p a,b,c
}
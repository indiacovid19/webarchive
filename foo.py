from functools import reduce

def gmdn(nums):
    amean = sum(nums) / len(nums)
    gmean = reduce(lambda x, y: x * y, nums, 1)**(1 / len(nums))
    nums.sort()
    median = nums[len(nums) // 2]
    return [amean, gmean, median]

print(gmdn([1, 2, 3, 4, 5]))

result = gmdn([1, 1, 2, 3, 5])
print(result)
for i in range(100):
    result = gmdn(result)
    print(i, result)

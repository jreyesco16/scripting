# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def inorderTraversal(self, root: Optional[TreeNode]) -> List[int]:
        stack = []

        node = root

        l = []

        while node != None:

            # left use case
            if node.left != None:
                stack.append(node)
                node = node.left
                continue

            else:
                l.append(node.val)

                # edge case: right node is None
                if node.right == None:
                    if len(stack) > 0:
                        node = stack.pop()
                        node.left = None
                        continue
                    # terminating case
                    else:
                        return l

            # right use case
            if node.right != None:
                node = node.right
                continue

        return l

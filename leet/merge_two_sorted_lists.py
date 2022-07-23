from typing import Optional

# Definition for singly-linked list.


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:

        root_node = ListNode()
        tmp_node = root_node

        node_1 = list1

        node_2 = list2

        while(True):

            # edge case
            if node_1 is None and node_2 is None:
                break

            # edge case
            if node_1 is None:
                tmp_node.next = node_2
                break

            # edge case
            if node_2 is None:
                tmp_node.next = node_1
                break

            if node_1.val > node_2.val:
                tmp_node.next = node_2
                node_2 = node_2.next
            else:
                tmp_node.next = node_1
                node_1 = node_1.next

            tmp_node = tmp_node.next

        return root_node.next


def main():
    tc_1 = ListNode(val=1)
    tc_1_2 = ListNode(val=2)
    tc_1.next = tc_1_2
    tc_1_3 = ListNode(val=4)
    tc_1_2.next = tc_1_3

    tc_2 = ListNode(val=1)
    tc_2_2 = ListNode(val=3)
    tc_2.next = tc_2_2
    tc_2_3 = ListNode(val=4)
    tc_2_2.next = tc_2_3

    expected = [1, 1, 2, 3, 4, 4]

    solution = Solution()

    output = solution.mergeTwoLists(tc_1, tc_2)

    test_node = output

    i = 0
    flag = True

    for x in expected:

        if x != test_node.val:
            flag = False
            break

        test_node = test_node.next

    if flag == True:
        print("PASSED")
    else:
        print("FAILED")


if __name__ == "__main__":
    main()

def setMatrixZereos( matrix):
    m = len(matrix)
    n = len(matrix[0])

    # create lists for rows and columns
    columns = list(range(0, m))
    rows = list(range(0, n))

    rowsToChange = []
    colsToChange = []

    for i in rows:
        for j in columns:
            if matrix[j][i] == 0:
                rowsToChange.append(i)
                colsToChange.append(j)

    for i in rowsToChange:
            for j in range(0, m):
                matrix[j][i] = 0

    for i in colsToChange:
        for j in range(0, n):
            matrix[i][j] = 0

    return matrix


def main():
    test = [[1,1,1],[1,0,1],[1,1,1]]
    expected = [[1,0,1],[0,0,0],[1,0,1]]
    result = setMatrixZereos(test)

    print("OUTPUT",result)
    print("EXPECTED", expected)


    if (expected == result):
        print("PASSING")
    else:
        print("FAILING")

if __name__ == "__main__":
    main()
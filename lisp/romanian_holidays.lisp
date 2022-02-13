;; csce 476 homework 4

;; city structures
(defstruct city
    name
    list neighbors
    h
    visited
)
;; node structure
(defstruct node
    parent
    children
    gn
    city
    path
)
;; all cities 
(setq Arad (make-city 
    :name "Arad"
    :neighbors '(("Zerind" 75) ("Sibiu" 140) ("Timisoara" 111))
    :h 366
    :visited Nil
    )
)
(setq Bucharest (make-city
    :name "Bucharest"
    :neighbors '(("Urziceni" 85) ("Giurgiu" 90) ("Pitesti" 101) ("Fagaras" 211))
    :h 0
    :visited Nil
    )
)
(setq Craiova (make-city
    :name "Craiova"
    :neighbors '(("Dobreta" 120) ("Pitesti" 138) ("Rimnicu Vilcea" 146))
    :h 160
    :visited Nil
    )
)
(setq Dobreta (make-city
    :name "Dobreta"
    :neighbors '(("Mehadia" 75) ("Craiova" 120))
    :h 242
    :visited Nil
    )
)
(setq Eforie (make-city
    :name "Eforie"
    :neighbors '(("Hirsova" 86))
    :h 161
    :visited Nil
    )
)
(setq Fagaras (make-city
    :name "Fagaras"
    :neighbors '(("Sibiu" 99) ("Bucharest" 211))
    :h 176
    :visited Nil
    )
)
(setq Giurgiu (make-city
    :name "Giurgiu"
    :neighbors '(("Bucharest" 90))
    :h 77
    :visited Nil
    )
)
(setq Hirsova (make-city
    :name "Hirsova"
    :neighbors '(("Eforie" 90) ("Urziceni" 98))
    :h 151
    :visited Nil
    )
)
(setq Iasi (make-city
    :name "Iasi"
    :neighbors '(("Neamt" 87) ("Vaslui" 92)) 
    :h 226
    :visited Nil
    )
)
(setq Lugoj (make-city
    :name "Lugoj"
    :neighbors '(("Mehadia" 70) ("Timisoara" 111))
    :h 244
    :visited Nil
    )
)
(setq Mehadia (make-city
    :name "Mehadia"
    :neighbors '(("Lugoj" 70) ("Dobreta" 75))
    :h 241
    :visited Nil
    )
)
(setq Neamt (make-city
    :name "Neamt"
    :neighbors '(("Iasi" 87))
    :h 234
    :visited Nil
    )
)
(setq Oradea (make-city
    :name "Oradea"
    :neighbors '(("Zerind" 71) ("Sibiu" 151))
    :h 380
    :visited Nil
    )
)
(setq Pitesti (make-city
    :name "Pitesti"
    :neighbors '(("Rimnicu Vilcea" 97) ("Craiova" 138) ("Bucharest" 101))
    :h 100
    :visited Nil
    )
)
(setq Rimnicu_Vilcea (make-city
    :name "Rimnicu Vilcea"
    :neighbors '(("Sibiu" 80) ("Craiova" 146) ("Pitesti" 97))
    :h 193
    :visited Nil
    )
)
(setq Sibiu (make-city
    :name "Sibiu"
    :neighbors '(("Oradea" 151) ("Arad" 140) ("Rimnicu Vilcea" 80) ("Fagaras" 99))
    :h 253
    :visited Nil
    )
)
(setq Timisoara (make-city
    :name "Timisoara"
    :neighbors '(("Arad" 118) ("Lugoj" 111))
    :h 329
    :visited Nil
    )
)
(setq Urziceni (make-city
    :name "Urziceni"
    :neighbors '(("Bucharest" 85) ("Vaslui" 142) ("Hirsova" 98))
    :h 80
    :visited Nil
    )
)
(setq Vaslui (make-city
    :name "Vaslui"
    :neighbors '(("Iasi" 92) ("Urziceni" 142))
    :h 199
    :visited Nil
    )
)
(setq Zerind (make-city
    :name "Zerind"
    :neighbors '(("Oradea" 71) ("Arad" 75))
    :h 374
    :visited Nil
    )
)

;; global with all cities as a list
(defvar all-cities-list (list Arad Bucharest Craiova Dobreta Eforie Fagaras Giurgiu Hirsova Iasi Lugoj Mehadia Neamt Oradea Pitesti Rimnicu_Vilcea Sibiu Timisoara Urziceni Vaslui Zerind))

;; global with all cities as a hash table
(defvar all-cities-htable (make-hash-table :test 'equal))
(setf (gethash "Arad" all-cities-htable) Arad)
(setf (gethash "Bucharest" all-cities-htable) Bucharest)
(setf (gethash "Craiova" all-cities-htable) Craiova)
(setf (gethash "Dobreta" all-cities-htable) Dobreta)
(setf (gethash "Eforie" all-cities-htable) Eforie)
(setf (gethash "Fagaras" all-cities-htable) Fagaras)
(setf (gethash "Giurgiu" all-cities-htable) Giurgiu)
(setf (gethash "Hirsova" all-cities-htable) Hirsova)
(setf (gethash "Iasi" all-cities-htable) Iasi)
(setf (gethash "Lugoj" all-cities-htable) Lugoj)
(setf (gethash "Mehadia" all-cities-htable) Mehadia)
(setf (gethash "Neamt" all-cities-htable) Neamt)
(setf (gethash "Oradea" all-cities-htable) Oradea)
(setf (gethash "Pitesti" all-cities-htable) Pitesti)
(setf (gethash "Rimnicu Vilcea" all-cities-htable) Rimnicu_Vilcea)
(setf (gethash "Sibiu" all-cities-htable) Sibiu)
(setf (gethash "Timisoara" all-cities-htable) Timisoara)
(setf (gethash "Urziceni" all-cities-htable) Urziceni)
(setf (gethash "Vaslui" all-cities-htable) Vaslui)
(setf (gethash "Zerind" all-cities-htable) Zerind)

;; global for nodes expanded
(setq nnv 0)

;; list all cities 
(defun all_cities_from_list ()
    (setq cities (list ))
    (loop for cit in all-cities-list
        do (setq cities (append cities (list (city-name cit))))
    )
    cities
)
;; structures of all cites
(defun all-cities-from-htable ()
    (setq cit-structs (list ))
    (loop for cit being each hash-value of all-cities-htable
        do (setq cit-structs (append cit-structs (list cit)))
    )
    (setq cit-structs (reverse cit-structs))
    cit-structs
)
;; return city from city list using name
(defun get-city-from-list (name)
    (loop for cit in all-cities-list
        do ( if (string-equal name (city-name cit))
                (return-from get-city-from-list cit)
            ) 
    )

    "city not found"
)
;; return city from city htable using key
(defun get-city-from-htable (key)
    (setq cit (gethash key all-cities-htable))
    (if (equal cit Nil)
        (return-from get-city-from-htable "city not found")
    )
    cit
)
;; return a list of neighbors of a city using cities list
(defun neighbors-using-list (name)
    (setq nbrs ( city-neighbors  (get-city-from-list name) ))
    (setq nbrs-list (list ))
    (loop for n in nbrs
        do(setq cit (get-city-from-list (car n)))
        do(setq nbrs-list (append nbrs-list (list cit)))
    )
    nbrs-list
)
;; return a list of neighbors of a city using htable
(defun neighbors-using-htable (name)
    (setq nbrs ( city-neighbors  (get-city-from-htable name) ))
    (setq nbrs-list (list ))
    (loop for n in nbrs
        do(setq cit (get-city-from-htable(car n)))
        do(setq nbrs-list (append nbrs-list (list cit)))
    )
    nbrs-list
)
;; return list of neighbors within a distance
(defun neighbors-within-d (name d)
    (setq nbrs ( city-neighbors  (get-city-from-htable name) ))
    (setq nbrs-list '())
    (loop for n in nbrs
        do (setq cit (get-city-from-htable (car n)))
        do (if (<= (car (reverse n)) d)
                ;; (setq x (get-city-from-htable (car n)))
                ;; (print cit)
                (setq nbrs-list (append nbrs-list (list cit (car (reverse n)) )))
            )
    )
    nbrs-list
)
;; return distance between city-1 and city-2
(defun neighbors-p (cit1 cit2)
    (setq d Nil)
    (setq nbrs ( city-neighbors (get-city-from-htable cit1)))
    (loop for n in nbrs
        do(if (string-equal cit2 (car n))
            (setq d (car (reverse n)))
        )
    )
    d
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FUNCTIONS USED FOR SEARCH-ALGORITHM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                                        ;; HELPER FUNCTIONS
;; remove all visted cites from neighbors list
(defun remove-visited (nbrs)
    (setq tmp-list (list ))
    (loop for n in nbrs
        do (if (not (city-visited (get-city-from-htable (city-name n)))) 
                    (setq tmp-list (append tmp-list (list n)))  
            )
    )
    (setq nbrs tmp-list)
    nbrs
)
;; used by dfs to check the stack of a node which is the path 
(defun check-stack (cit path)
    (loop for c in path
        do (if (string-equal c (city-name cit))
            (return-from check-stack Nil)
        )
    )
    T
)
;; set the children for a node
(defun set-node-children (node children)
    (setq x (make-node
            :parent (node-parent node)
            :children children
            :gn (node-gn node)
            :city (node-city node)
            :path (node-path node)
        )
    )
    x
)

;; check if nodes are the same
(defun same-node (node1 node2)
    (if (and (eq (node-city node1) (node-city node2)) (= (node-gn node1) (node-gn node2)))
        (return-from same-node T)
    )
    Nil
)

;; functions that pops out node from frindge 
(defun pop-node (node frindge)
    (setq updated-frindge (list ))
    (loop for n in frindge
        do (if (not (same-node node n))
                (setq updated-frindge (append updated-frindge (list n)))
            )
    )
    updated-frindge
)
;; reset all visited cities to Nil
(defun reset-cities-to-unvisited ()
      (setq all-cities-names (all_cities_from_list))
      (loop for city in all-cities-names 
        do (setf (city-visited (get-city-from-htable city)) Nil)
      )
)

                                                    ;; MAIN SEARCH FUNCTIONS
;; neighbors is structures      returns (fn)
(defun evaluate-node (node strategy)

    (setq fn 0)
    (setq gn 0)
    (setq hn 0)

    (setq parent (node-parent node))
    
    ;; dfs
    (if (string-equal strategy "dfs")
        (progn 
            (setq gn (+ (node-gn parent) (neighbors-p (node-city node)  (node-city parent))))
            (return-from evaluate-node (list fn))  
        )
    )

    ;; greedy best first search
    (if (string-equal strategy "greedy")
        (progn
            ;; (setq gn (+ (node-gn parent) (neighbors-p (node-city node)  (node-city parent))))
            (setq hn (city-h (get-city-from-htable (node-city node))))
            (setq fn hn)
            (return-from evaluate-node (list fn))
        
        )
    )
    ;; A*
    (if (string-equal strategy "astar")
        (progn
            (setq gn (+ (node-gn parent) (neighbors-p (node-city node)  (node-city parent))))
            (setq hn (city-h (get-city-from-htable (node-city node))))
            (setq fn (+ gn hn))
            (return-from evaluate-node (list fn))
        )
    )
    (list fn)
)
;; takes node and determines it's children
(defun expand-node (node strategy type)
    ;; expanded a new node, then update global node expanded count
    (setq nnv (+ nnv 1))

    (setq nbrs (neighbors-using-htable (node-city node)))

    ;;if the type is a graph remove all visited cities from nieghbors list
    (if (string-equal type "graph")
        (setq nbrs (remove-visited nbrs))
    )

    ;;if dfs
    (if (string-equal strategy "dfs")
        (progn
            (setq node-neighbors (list ))
            (loop for n in nbrs
                do (if (and   (not (city-visited (get-city-from-htable (city-name n))))   (check-stack n (node-path node)))
                    (progn
                        (setq node-neighbors (append node-neighbors (list 
                            (make-node 
                                :parent node 
                                :children (list ) 
                                :gn (+ (node-gn node)   (neighbors-p (node-city node)   (city-name n)))
                                :city (city-name n)
                                :path (append (node-path node) (list (city-name n)))))
                            )
                        )
                    )
                )
            )
            (setq nbrs node-neighbors)
        )
    )
    ; if greedy & A*
    (if (or (string-equal strategy "greedy") (string-equal strategy "astar"))
        (progn
            (setq node-neighbors (list ))
            (loop for n in nbrs
               do (setq node-neighbors (append node-neighbors (list 
                    (make-node 
                        :parent node 
                        :children (list ) 
                        :gn (+ (node-gn node)   (neighbors-p (node-city node)   (city-name n)))
                        :city (city-name n)
                        :path (append (node-path node) (list (city-name n)))))
                    )
                )
            )
            (setq nbrs node-neighbors)
        )
    )
    nbrs
)
;; select best option from frindge
(defun select-from-frindge (frindge strategy)

    ;; for dfs
    (if (string-equal strategy "dfs")
        (progn
            (return-from select-from-frindge (car frindge))
        )
    )
    (if (or (string-equal strategy "greedy") (string-equal strategy "astar"))
        (progn
            (setq min 100000)
            (setq optimal-node Nil)
            (loop for n in frindge
                do (setq fn (car (evaluate-node n strategy)))
                do (if (> min fn)   
                        (progn
                            (setq min fn)
                            (setq optimal-node n)
                        )
                    )
            )
            (return-from select-from-frindge optimal-node)
        )
    )
    (list )
)

;; search from start to end (params "start-city" "end-city" "astar"/"greedy"/"uninformed" "tree"/"graph")
;; output 1.) path from start to end    2.) # of nodes generated/visited    3.) g(n)    4.) run time
(defun search-algorithm (start end strategy type)

    ;; if graph then mark the first city as visited
    (if (string-equal "graph" type)
        (setf (city-visited (get-city-from-htable start)) T)
    )
   


    (setq start-time (get-internal-real-time))
    (setq node (make-node
            :parent Nil
            :children (list )
            :gn 0
            :city start
            :path (list start)
        )
    )

    ;; frindge used for astar
    (setq frindge (list ))

    ;; loop until search algorithm has met a ending condition
    (loop while (not (string-equal (node-city node) end) )
        do (setq children (expand-node node strategy type))
        do (setq node (set-node-children node children))
        ; if astar save child to frindge
        do (if (string-equal strategy "astar")
                (progn
                    (setq frindge (append frindge children))
                    (setq optimal-node (select-from-frindge frindge strategy))
                    (setq frindge (pop-node optimal-node frindge))

                )
                (setq optimal-node (select-from-frindge children strategy))
            )
        do (if (eq optimal-node (list ))
            (progn  
                (setf (city-visited (get-city-from-htable (node-city node))) T)
                ;;no path found
                (if (or (eq (node-parent node) Nil) (string-equal type "graph"))
                    (progn
                        (setq cpu-time (- (get-universal-time) start-time))
                        (setq path (node-path node))
                        (setq gn (node-gn node))
                        (return-from search-algorithm (list (list "No path found") nnv gn cpu-time))
                    )
                )
                ;; backtracking
                (setq node (node-parent node))
            )
            (progn
                ;; for graph mark optimal path as visited
                (if (string-equal type "graph")
                    (setf (city-visited (get-city-from-htable (node-city optimal-node))) T)
                )
                (setq node optimal-node)
            )
        )
    )
    
    ;; calculated cpu time
    (setq cpu-time (- (get-internal-real-time) start-time))
    (setq path (node-path node))
    (setq gn (node-gn node))
    (list path nnv gn cpu-time)
)

;; main function
(defun romanian_holidays ()
    ;; Task 4.1.2
    (setq cities (all_cities_from_list))
    (print "List of all the cites: ")
    (print cities)
    (terpri)

    ;; Task 4.1.3
    (setq city-structs (all-cities-from-htable))
    (print "List of all strucutes of cities: ")
    (loop for struct in city-structs
        do (print struct)
    )
    (terpri)

    ;; Task 4.1.4
    (print "Searching for Pitesti in list: ")
    (print (get-city-from-list "Pitesti"))
    (terpri)
    (print "Searching for Pitesti in htable: ")
    (print (get-city-from-htable "Pitesti"))
    (terpri)

    ;; Task 4.1.5
    (print "Neighbors of Timisoara using list")
    (print (neighbors-using-list "Timisoara"))
    (terpri)
    (print "Neighbos of Timisoara using htable")
    (print (neighbors-using-htable "Timisoara"))
    (terpri)

    ;; Task 4.1.6
    (print "Neighbors of Bucharest with distance of 100")
    (print (neighbors-within-d "Bucharest" 100))
    (terpri)

    ;; Task 4.1.7
    (print "Distance between Arad and Sibiu: ")
    (print (neighbors-p "Arad" "Sibiu"))
    (terpri) 
)

(defun main ()

    (romanian_holidays)
    

    ;; test all possible options for search algorithm
    (setq strategies (list "dfs" "greedy" "astar"))
    (setq search-type (list "tree" "graph"))
    (setq all-city-names (all_cities_from_list))
    (loop for strategy in strategies
        do (loop for type in search-type
            do (loop for city in all-city-names
                do (print (list city strategy type))
                do (setq result (time (search-algorithm city "Bucharest" strategy type)))
                do (print result)
                do (terpri)

                ;; set all cities visited back to Nil
                do(if (or (string-equal strategy "dfs") (string-equal type "graph"))
                    (reset-cities-to-unvisited )
                )
                ;; reset expanded nodes global var
                do (setq nnv 0)

            )
        )
    
    )
    
    ;; (setq result (time (search-algorithm "Lugoj" "Bucharest" "astar" "graph")))
    ;; (print result)
)

;; calling main
(main)
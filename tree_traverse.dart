class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.val, this.left, this.right);
}

void preorder(TreeNode? root) {
  if (root == null) {
    return;
  }
  print("${root.val} ");
  preorder(root.left);
  preorder(root.right);
}

void inorder(TreeNode? root) {
  if (root == null) {
    return;
  }
  preorder(root.left);
  print("${root.val} ");
  preorder(root.right);
}

void postorder(TreeNode? root) {
  if (root == null) {
    return;
  }
  postorder(root.left);
  postorder(root.right);
  print("${root.val} ");
}

void main() {
  TreeNode root = TreeNode(1, null, null);
  TreeNode node1 = TreeNode(2, null, null);
  TreeNode node2 = TreeNode(3, null, null);
  root.left = node1;
  root.right = node2;
  print("Preorder Traversal : ");
  preorder(root);
  print("\nInorder Traversal : ");
  inorder(root);
  print("\nPostorder Traversal : ");
  postorder(root);
}

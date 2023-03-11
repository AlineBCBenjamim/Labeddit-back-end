export interface CreateCommentInput {
    postId: string,
    content: string,
    token: string | undefined
}

export interface CreateCommentOutput {
    message: string
}

export interface CommentInput {
    postId: string,
    content: string,
    token: string | undefined
}

export interface CommentsByPostIdOutput {
    message: string
}

export interface GetCommentsByPostIdInput {
    postId: string,
    token: string | undefined
}
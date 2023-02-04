import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";

const initialState = {
  posts: [],
  loading: false,
};
export const fetchPosts = createAsyncThunk(
  "post/fetchAll",
  async (post, thunkAPI) => {
    const response = await axios.get("/api/post");
    console.log(response);
    return response.data;
  }
);

// user counter sample
const postsSlice = createSlice({
  name: "posts",
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder.addCase(fetchPosts.fulfilled, (state, action) => {
      // console.log(action.payload);
      state.posts = action.payload;
      // console.log(state.posts);
      state.loading = false;
    });
    builder.addCase(fetchPosts.pending, (state) => {
      state.loading = true;
    });
    builder.addCase(fetchPosts.rejected, (state) => {
      state.loading = false;
    });
  },
});

// Action creators are generated for each case reducer function
// export const { fetchPost } = postsSlice.actions;

export default postsSlice.reducer;

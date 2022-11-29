import React from "react";
import { useState } from "react";
import AddBoxOutlinedIcon from "@mui/icons-material/AddBoxOutlined";
import PostModal from "./PostModal";

export default function AddIcon() {
  const [isClick, setIsShown] = useState(false);

  function handleClick() {
    setIsShown(true);
    console.log("clicked");
  }

  function handleClose() {
    setIsShown(false);
  }

  return (
    <div>
      <AddBoxOutlinedIcon onClick={handleClick} />
      <PostModal open={isClick} handleClose={handleClose} />
    </div>
  );
}

import React from "react";
import { useState } from "react";
import AddBoxOutlinedIcon from "@mui/icons-material/AddBoxOutlined";
import { Add } from "@mui/icons-material";
import PostModal from "../PostModal";
import { Typography } from "@mui/material";
import { withStyles } from "@mui/styles";
const styles = (theme) => ({
  list: {
    transition: "0.1s ease-in",
    margin: "3px",
    "&:hover": {
      backgroundColor: "rgb(219, 219, 219, 0.5)",
      cursor: "pointer",
    },
  },
});
function AddIcon({ classes }) {
  const [isClick, setIsShown] = useState(false);

  function handleClick() {
    setIsShown(true);
    console.log("clicked");
  }

  function handleClose() {
    setIsShown(false);
  }

  return (
    <li
      className={classes.list}
      style={{
        display: "flex",
        flexDirection: "row",
        padding: "10px",
        borderRadius: "20px",
        margin: "10px",
        alignItems: "center",
      }}
    >
      <Add onClick={handleClick} fontSize="large" />
      <Typography style={{ marginLeft: "20px" }}>create</Typography>
    </li>
  );
}
export default withStyles(styles)(AddIcon);

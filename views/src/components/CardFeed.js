import React from "react";
import { withStyles } from "@mui/styles";
import { People } from "@mui/icons-material";
import {
  Card,
  CardContent,
  CardHeader,
  CardMedia,
  Typography,
} from "@mui/material";

const styles = (theme) => ({
  cardContainer: {
    width: "382px",
    height: "924px",
    borderRadius: "3px",
  },
  icon: {
    borderRadius: "50%",
    backgroundColor: "#f3f3f3",
    padding: "3px",
  },
});
function CardFeed({ title, postImgUrl, classes }) {
  return (
    <Card className={classes.cardContainer}>
      <People className={classes.icon} />
      <CardMedia
        component="img"
        alt="Card Image"
        height="400"
        image={postImgUrl}
      />
      <CardContent>
        <Typography variant="body1" component="p">
          {title}
        </Typography>
      </CardContent>
    </Card>
  );
}
export default withStyles(styles)(CardFeed);

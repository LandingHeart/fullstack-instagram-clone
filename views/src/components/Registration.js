import React from "react";
import { decrement, increment } from "../store/users.slice";
import { useSelector, useDispatch } from "react-redux";

export default function Registration() {
  const count = useSelector((state) => state.users.value);
  const dispatch = useDispatch();
  return (
    <div>
      Registration
      <button
        aria-label="Increment value"
        onClick={() => dispatch(increment())}
      >
        Increment
      </button>
      <span>{count}</span>
      <button
        aria-label="Decrement value"
        onClick={() => dispatch(decrement())}
      >
        Decrement
      </button>
    </div>
  );
}

import React from "react";
import { useSelector, useDispatch } from "react-redux";
import { decrement, increment } from "../store/users.slice";

export function Counter({ data }) {
  const count = useSelector((state) => state.users.value);
  const dispatch = useDispatch();
  console.log("data from parent ", data);
  return (
    <div>
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
